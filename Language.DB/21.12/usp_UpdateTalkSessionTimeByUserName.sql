ALTER  PROCEDURE [dbo].[usp_UpdateTalkSessionTimeByUserName]
	@UserName nvarchar(100),
	@SessionTime int
AS
BEGIN
	
	declare @BalanceTime as int
	DECLARE @IsActive bit = 1
	DECLARE @UserID bigint
	DECLARE @TimeSpent bigint
	DECLARE @TempSessionTime bigint
	DECLARE @TempBalanceTime bigint
	
	SELECT @UserID = UserID FROM [User] where UserName = @UserName

		UPDATE UserTalkSubscription 
		SET SessionTime = @SessionTime
		WHERE UserID = @UserID AND IsActive = 1

	    --exec usp_InsertTalkHistory @UserName, @TimeSpent, @PartnerUserName

END





