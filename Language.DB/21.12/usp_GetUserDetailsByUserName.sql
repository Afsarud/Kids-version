USE [Palaygo_Prod]
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateTalkSessionTimeByUserName]    Script Date: 11/12/2024 10:23:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[usp_GetUserDetailsByUserName]
    @UserName NVARCHAR(50)
AS
BEGIN
    DECLARE @ProfilePhoto NVARCHAR(50)
    DECLARE @UserId BIGINT
    DECLARE @StartTime INT
    DECLARE @EndTime INT
    DECLARE @SchoolID INT
    DECLARE @WithinRange BIT

    -- Fetch UserID and SchoolID
    SELECT 
        @UserId = UserID, 
        @SchoolID = SchoolID 
    FROM [User] 
    WHERE UserName = @UserName

    -- Fetch Start and End Time from SchoolInfo
    SELECT 
        @StartTime = StartTime, 
        @EndTime = EndTime 
    FROM SchoolInfo 
    WHERE SchoolID = @SchoolID

    -- Calculate @WithinRange based on current time
    IF ((DATEPART(HH, GETDATE()) * 60 + DATEPART(MI, GETDATE())) BETWEEN (@StartTime * 60) AND (@EndTime * 60))
        SET @WithinRange = 1
    ELSE
        SET @WithinRange = 0

    -- Fetch Profile Photo
    SELECT @ProfilePhoto = Photo 
    FROM UserPhoto 
    WHERE UserID = @UserID AND IsProfilePhoto = 1

    -- Fallback if no profile photo is set
    IF @ProfilePhoto IS NULL
        SELECT TOP 1 @ProfilePhoto = Photo 
        FROM UserPhoto 
        WHERE UserID = @UserID

    -- Select user details and permission status based on simplified CASE logic
    SELECT 
        U.[UserID],
        U.[UserNo],
        U.[UserName],
        U.[FirstName],
        U.[MiddleName],
        U.[LastName],
        U.[Address],
        U.[DateOfBirth],
        U.[Telephone],
        U.[Fax],
        U.[Email],
        U.[Password],
        U.[Password2],
        U.[CreateDate],
        U.[ModifiedDate],
        U.[ClassID],
        U.[UserTypeID],
        U.[CountryID],
        U.[CityID],
        U.[SchoolID],
        U.[LevelID],
        U.[IsPalleteVisible],
        U.[AfterSchool],
        U.[IsActive],
        U.[StatusText],
        U.[Avatar],
        U.[NativeLanguage],
        U.[LearningLanguage],
        U.[SubNativeLanguage],
        U.[TeachersName],
        U.[ParentsName],
        U.[LastLogin],
        U.[IsOnline],
        U.[Gender],
        U.[Introduction],
        U.HasAgreedTC,
        Ut.UserTypeName,
        @ProfilePhoto AS ProfilePhoto,
        U.Theme,
        U.GradeID,
        U.DontShowVideo,
        U.DontShowNewTab,
        U.Skin,
        U.SubNativeLanguage2,
        U.IsDemo,
        U.TrialExpirationDate,
        CAST(CASE WHEN U.TrialExpirationDate < GETDATE() THEN 1 ELSE 0 END AS BIT) AS IsTrialExpired,
        CASE 
            WHEN S.SchoolTypeID = 1 AND S.AfterSchool = 1 AND @WithinRange = 1 THEN 'continuelogin'
            WHEN S.SchoolTypeID = 1 AND S.AfterSchool = 0 AND ISNULL(L.IsLevelDemo, 0) = 0 THEN 'deniedlogin'
            WHEN S.SchoolTypeID = 1 AND S.AfterSchool = 1 AND ISNULL(L.IsLevelDemo, 0) = 0 AND ISNULL(U.Email, '') = '' THEN 'permissionrequired'
            WHEN S.SchoolTypeID = 1 AND S.AfterSchool = 1 AND ISNULL(L.IsLevelDemo, 0) = 0 AND ISNULL(U.Email, '') <> '' THEN 'continuelogin'
            WHEN S.SchoolTypeID = 3 AND S.AfterSchool = 1 AND ISNULL(L.IsLevelDemo, 0) = 0 THEN 'continuelogin'
            WHEN S.SchoolTypeID = 3 AND S.AfterSchool = 0 AND ISNULL(L.IsLevelDemo, 0) = 0 AND ISNULL(U.Email, '') = '' THEN 'permissionrequired'
            WHEN S.SchoolTypeID = 3 AND S.AfterSchool = 0 AND ISNULL(L.IsLevelDemo, 0) = 0 AND ISNULL(U.Email, '') <> '' THEN 'continuelogin'
            WHEN S.SchoolTypeID = 4 AND ISNULL(L.IsLevelDemo, 0) = 0 AND ISNULL(U.Email, '') = '' THEN 'permissionrequired'
        END AS PermissionStatus,
        U.Reference,
        U.SchoolEntry,
        U.AllowTalk,
        U.Furigana,
        U.Custom1,
        U.Custom2,
        U.Custom3,
        U.Custom4,
        U.Custom5,
        U.Note1,
        U.Note2,
        U.Note3,
        U.Note4,
        U.Note5,
        SequenceOptionFlag,
        NativeOptionFlag,
        SubLanguageOptionFlag,
        SubLanguage2OptionFlag,
        IsOptionUpdated,
        COALESCE(U.Custom3, U.Custom2, C.ClassName) AS ClassName,
        SendPasswordToTeacher,
        TeachersEmail,
        U.SoundAndMail,
        U.IsCanTalk,
        U.DontShowQuickGuide,
        u.OrderByLearningLanguageFlag,
        U.IsSupport,
        CAST(CASE WHEN U.PasswordExpiration IS NULL THEN 0 WHEN U.PasswordExpiration < GETDATE() THEN 1 ELSE 0 END AS BIT) AS ShouldChangePassword,
        LinkKey,
        UTS.SessionTime
    FROM [User] u 
    INNER JOIN UserType Ut ON u.UserTypeID = Ut.UserTypeID
    LEFT JOIN [Level] L ON U.LevelID = L.LevelID
    LEFT JOIN SchoolInfo S ON u.SchoolID = S.SchoolID 
    LEFT JOIN Class C ON u.ClassID = C.ClassID
    LEFT JOIN UserTalkSubscription UTS ON U.UserID = UTS.UserID AND UTS.IsActive = 1
    WHERE u.UserID = @UserId
END
GO
