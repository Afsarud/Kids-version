﻿
	SET IDENTITY_INSERT OR_03292017.DBO.sentence ON
	GO


BEGIN TRAN

	BEGIN TRY

		declare @palette as table
		(
			Paletteid bigint
		)

		declare @Sentence as table
		(
			SentenceID bigint,
			Paletteid bigint
		)
		declare @Phrase as table
		(
			PhraseID bigint,
			SentenceID bigint
		)

		INSERT INTO @palette
		select p.PaletteID 
		from Palette P
		inner join Sentence s on p.PaletteID = s.PaletteID
		where SentenceLanguageCode = 'zh-CN' and P.PaletteID <> 31


		INSERT INTO @Sentence
		SELECT SentenceID, PaletteID from Sentence 
		where PaletteID in (select PaletteID from @palette)

		INSERT @Phrase
		select Phraseid, SentenceID 
		from Phrase
		where SentenceID in ( select SentenceID from @Sentence )


			
			
			declare @IDAddends bigint = 8000

			

			INSERT INTO OR_03292017.dbo.Sentence ( [SentenceID] ,[PaletteID] ,[CreateDate],[CreatedBy],[SentenceSoundFile],[SentenceImageFile]
					,[SentenceLanguageCode],[Keyword])
  			SELECT [SentenceID] + @IDAddends,[PaletteID] + @IDAddends,[CreateDate],[CreatedBy],[SentenceSoundFile],[SentenceImageFile]
					,[SentenceLanguageCode],[Keyword]
			FROM [Sentence] where SentenceID in ( select SentenceID from @Sentence )
			
		commit TRAN

	END TRY
	
BEGIN CATCH

	ROLLBACK TRAN

	DECLARE @ErrorMessage NVARCHAR(4000);
	SELECT @ErrorMessage=ERROR_MESSAGE()
	RAISERROR(@ErrorMessage, 10, 1);
END CATCH

	SET IDENTITY_INSERT OR_03292017.DBO.sentence OFF
	GO
	
