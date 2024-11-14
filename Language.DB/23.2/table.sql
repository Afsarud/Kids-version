
declare @id int
Insert into TopCategoryHeader values(getdate(), 0, 0, 0,12, 0)
set @id = SCOPE_IDENTITY()

INSERT INTO TopCategory values (@id, 'SDGs', 'en-US'), (@id, 'SDGs', 'ja-JP'),  (@id, 'SDGs', 'zh-CH')