USE [RwaApartmani]
GO
/****** Object:  StoredProcedure [dbo].[DeleteApartman]    Script Date: 8.7.2022. 19:08:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 CREATE proc [dbo].[DeleteApartman]
	@Id int
	as
	begin
	update Apartment
	set DeletedAt=GETDATE()
	where Apartment.Id=@Id
	end
GO
/****** Object:  StoredProcedure [dbo].[DeleteApartmentPicture]    Script Date: 8.7.2022. 19:08:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[DeleteApartmentPicture]
	@Guid uniqueidentifier
	as
	begin
	update ApartmentPicture
	set DeletedAt=GETDATE()
	where ApartmentPicture.Guid=@Guid
	end
GO
/****** Object:  StoredProcedure [dbo].[DeleteTag]    Script Date: 8.7.2022. 19:08:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE proc [dbo].[DeleteTag]
	@Id int
	as
	begin
	delete from Tag
	where Tag.Id=@Id
	end
GO
/****** Object:  StoredProcedure [dbo].[DeleteTaggedApartment]    Script Date: 8.7.2022. 19:08:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[DeleteTaggedApartment]
	@Guid uniqueidentifier
	as
	begin
	delete from TaggedApartment
	where TaggedApartment.Guid=@Guid
	end
GO
/****** Object:  StoredProcedure [dbo].[DeleteTagType]    Script Date: 8.7.2022. 19:08:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[DeleteTagType]
	@Guid uniqueidentifier
	as
	begin
	delete from TagType
	where TagType.Guid=@Guid
	end
GO
/****** Object:  StoredProcedure [dbo].[DeleteUser]    Script Date: 8.7.2022. 19:08:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DeleteUser]
	@Guid uniqueidentifier
	as
	begin
	update AspNetUsers
	set DeletedAt=GETDATE()
	where AspNetUsers.Guid=@Guid
	end
GO
/****** Object:  StoredProcedure [dbo].[GetApartmentName]    Script Date: 8.7.2022. 19:08:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[GetApartmentName]
	@Id int
	as
	begin
	select Apartment.Name from Apartment
	where Apartment.Id=@Id
	end
GO
/****** Object:  StoredProcedure [dbo].[GetApartmentNameEng]    Script Date: 8.7.2022. 19:08:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetApartmentNameEng]
	@Id int
	as
	begin
	select Apartment.NameEng from Apartment
	where Apartment.Id=@Id
	end
GO
/****** Object:  StoredProcedure [dbo].[GetApartmentOwners]    Script Date: 8.7.2022. 19:08:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetApartmentOwners]
as
begin
	select * from ApartmentOwner
	order by Name
end
GO
/****** Object:  StoredProcedure [dbo].[GetAvailableApartments]    Script Date: 8.7.2022. 19:08:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE proc [dbo].[GetAvailableApartments]
	as
	begin
	select Apartment.Name, ApartmentStatus.Name as 'StatusName', ApartmentStatus.Id as 'StatusId' from Apartment
	inner join ApartmentStatus on ApartmentStatus.Id = Apartment.StatusId
	where Apartment.DeletedAt IS NULL
	end
GO
/****** Object:  StoredProcedure [dbo].[GetGradovi]    Script Date: 8.7.2022. 19:08:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetGradovi]
as
begin
	select * from City
	order by Name
end
GO
/****** Object:  StoredProcedure [dbo].[GetTagsAndApartmentCount]    Script Date: 8.7.2022. 19:08:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetTagsAndApartmentCount]
as
begin
select Tag.Guid, Tag.TypeId, Tag.Name, Tag.NameEng, COUNT(TaggedApartment.ApartmentId) as 'ApartmentCount' from TaggedApartment
inner join Tag on Tag.Id=TaggedApartment.TagId
Group by Tag.Name, Tag.Guid, Tag.NameEng, Tag.TypeId
end
GO
/****** Object:  StoredProcedure [dbo].[GetTagsAndApartmentCountZero]    Script Date: 8.7.2022. 19:08:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetTagsAndApartmentCountZero]
as
begin
select Tag.Id, Tag.TypeId, Tag.Name, Tag.NameEng from Tag
where Tag.Id NOT IN (select TaggedApartment.TagId from TaggedApartment)
end
GO
/****** Object:  StoredProcedure [dbo].[GetTagsAndZeroApartmentCount]    Script Date: 8.7.2022. 19:08:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetTagsAndZeroApartmentCount]
as
begin
select Apartment.Id, Apartment.Name from Apartment
where Apartment.Id NOT IN (select TaggedApartment.ApartmentId from TaggedApartment)
end
GO
/****** Object:  StoredProcedure [dbo].[GetTagsForApartment]    Script Date: 8.7.2022. 19:08:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetTagsForApartment]
@Id int
as
begin
select Tag.Id,Tag.CreatedAt, Tag.TypeId,Tag.Name, Tag.NameEng from TaggedApartment
inner join Tag on Tag.Id=TaggedApartment.TagId
where TaggedApartment.ApartmentId=@Id
end
GO
/****** Object:  StoredProcedure [dbo].[GetTagType]    Script Date: 8.7.2022. 19:08:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	 create proc [dbo].[GetTagType]
	@Id int
	as
	begin
	select TagType.Name, TagType.NameEng from TagType
	where TagType.Id=@Id
	end
GO
/****** Object:  StoredProcedure [dbo].[GetTagTypeName]    Script Date: 8.7.2022. 19:08:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	 create proc [dbo].[GetTagTypeName]
	@Id int
	as
	begin
	select TagType.Name from TagType
	where TagType.Id=@Id
	end
GO
/****** Object:  StoredProcedure [dbo].[GetTagTypeNameEng]    Script Date: 8.7.2022. 19:08:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

		 CREATE proc [dbo].[GetTagTypeNameEng]
	@Id int
	as
	begin
	select TagType.NameEng from TagType
	where TagType.Id=@Id
	end
GO
/****** Object:  StoredProcedure [dbo].[GetUser]    Script Date: 8.7.2022. 19:08:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetUser]
 @Guid uniqueidentifier
 as
 begin
 select * from AspNetUsers
 where Guid=@Guid
 end
GO
/****** Object:  StoredProcedure [dbo].[GetUsers]    Script Date: 8.7.2022. 19:08:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetUsers]
as
begin
	select * from AspNetUsers
	order by UserName
end
GO
/****** Object:  StoredProcedure [dbo].[InsertApartment]    Script Date: 8.7.2022. 19:08:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[InsertApartment]
 @OwnerId int,
 @CityId int,
 @Address nvarchar(250),
 @Name nvarchar(250),
 @NameEng nvarchar(250),
 @Price money,
 @MaxAdults int,
 @MaxChildren int,
 @TotalRooms int,
 @BeachDistance int
 as
 begin 
  insert into Apartment(Guid, CreatedAt, OwnerId, StatusId, CityId, Address, Name, NameEng, Price, MaxAdults, MaxChildren, TotalRooms, BeachDistance, TypeId)
  values (NEWID(),GetDate(),@OwnerId,3,@CityId,@Address,@Name,@NameEng,@Price,@MaxAdults,@MaxChildren,@TotalRooms,@BeachDistance, 0)
end
GO
/****** Object:  StoredProcedure [dbo].[InsertApartmentPicture]    Script Date: 8.7.2022. 19:08:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[InsertApartmentPicture]
 @ApartmentId int,
 @Path nvarchar(250),
 @Base64Content varchar(max),
 @Name nvarchar(250),
 @IsRepresentative bit
 as
 begin 
  insert into ApartmentPicture(Guid, CreatedAt, ApartmentId, Path, Base64Content, Name, IsRepresentative)
  values (NEWID(),GetDate(),@ApartmentId,@Path,@Base64Content,@Name,@IsRepresentative)
end
GO
/****** Object:  StoredProcedure [dbo].[InsertApartmentReservation]    Script Date: 8.7.2022. 19:08:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[InsertApartmentReservation]
@ApartmentId int,
@Details nvarchar(1000),
@UserId int,
@UserName nvarchar(250),
@UserEmail nvarchar(250),
@UserPhone nchar(20),
@UserAddress nvarchar(1000)

as
begin
insert into ApartmentReservation ( Guid, CreatedAt, ApartmentId, Details, UserId, UserName, UserEmail, UserPhone, UserAddress)
values(NEWID(),GetDate(),@ApartmentId,@Details,@UserId,@UserName,@UserEmail,@UserPhone,@UserAddress)
end
GO
/****** Object:  StoredProcedure [dbo].[InsertApartmentReview]    Script Date: 8.7.2022. 19:08:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[InsertApartmentReview] 
@ApartmentId int,
@UserId int,
@Details nvarchar(1000),
@Stars int 
 as
 begin 
  insert into ApartmentReview(Guid, CreatedAt, ApartmentId, UserId, Details, Stars)
  values (NEWID(),GetDate(),@ApartmentId,@UserId,@Details,@Stars)
end
GO
/****** Object:  StoredProcedure [dbo].[InsertTag]    Script Date: 8.7.2022. 19:08:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[InsertTag]
 @TypeId int,
 @Name nvarchar(250),
 @NameEng nvarchar(250)
 as
 begin 
  insert into Tag(Guid, CreatedAt, TypeId, Name, NameEng)
  values (NEWID(),GetDate(),@TypeId,@Name,@NameEng)
end
GO
/****** Object:  StoredProcedure [dbo].[InsertTaggedApartment]    Script Date: 8.7.2022. 19:08:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[InsertTaggedApartment]
 @ApartmentId int,
 @TagId int
 as
 begin 
  insert into TaggedApartment(Guid,  ApartmentId, TagId)
  values (NEWID(),@ApartmentId,@TagId)
end
GO
/****** Object:  StoredProcedure [dbo].[InsertTagType]    Script Date: 8.7.2022. 19:08:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[InsertTagType]
 @Name nvarchar(250),
 @NameEng nvarchar(250)
 as
 begin 
  insert into Tag(Guid, CreatedAt, Name, NameEng)
  values (NEWID(),GetDate(),@Name,@NameEng)
end
GO
/****** Object:  StoredProcedure [dbo].[LoginUser]    Script Date: 8.7.2022. 19:08:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[LoginUser]
   @Email nvarchar(256),
   @PasswordHash nvarchar(max),
   @Guid uniqueidentifier out
as
begin
	select Guid from AspNetUsers
	where Email=@Email or PasswordHash=@PasswordHash
end
GO
/****** Object:  StoredProcedure [dbo].[RegisterUser]    Script Date: 8.7.2022. 19:08:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[RegisterUser]
   @Email nvarchar(256),
   @PasswordHash nvarchar(max),
   @PhoneNumber nvarchar(max),
   @UserName nvarchar(256),
   @Address nvarchar(1000)
as
begin
	insert into AspNetUsers(Guid, CreatedAt, Email, EmailConfirmed, PasswordHash, PhoneNumber, PhoneNumberConfirmed, LockoutEnabled, AccessFailedCount, UserName, Address)
	values (NEWID(), GetDate(), @Email, 1, @PasswordHash, @PhoneNumber, 1, 0, 0, @UserName, @Address)
end
GO
/****** Object:  StoredProcedure [dbo].[SelectApartmentPictures]    Script Date: 8.7.2022. 19:08:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SelectApartmentPictures]
as
begin
select *
from ApartmentPicture
inner join Apartment on Apartment.Id=ApartmentPicture.ApartmentId
end

GO
/****** Object:  StoredProcedure [dbo].[SelectApartmentReviews]    Script Date: 8.7.2022. 19:08:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SelectApartmentReviews]
 as
 begin 
  select * from ApartmentReview
end
GO
/****** Object:  StoredProcedure [dbo].[SelectApartments]    Script Date: 8.7.2022. 19:08:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SelectApartments]
as
begin
select Apartment.Id as "ApartmentID", Apartment.Guid, Apartment.CreatedAt, Apartment.DeletedAt, ApartmentOwner.Id as 'OwnerId',ApartmentOwner.Guid as 'OwnerGuid',ApartmentOwner.Name as 'ApartmentOwner',ApartmentOwner.Name as 'ApartmentOwnerEng',ApartmentStatus.Name as 'ApartmentStatus',ApartmentStatus.Guid as 'ApartmentStatusGuid',ApartmentStatus.Id as 'ApartmentStatusId', City.Name AS'City', City.Guid AS'CityGuid', City.Id AS'CityId',Address, Apartment.Name, Apartment.NameEng, Price, MaxAdults, MaxChildren, TotalRooms, BeachDistance 
from Apartment
inner join ApartmentOwner on ApartmentOwner.Id=Apartment.OwnerId
inner join ApartmentStatus on ApartmentStatus.Id=Apartment.StatusId
inner join City on City.Id=Apartment.CityId
end
GO
/****** Object:  StoredProcedure [dbo].[SelectApartmentsReservations]    Script Date: 8.7.2022. 19:08:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SelectApartmentsReservations]
as
begin
select Apartment.Id, Apartment.Guid, Apartment.CreatedAt, Apartment.Name, Apartment.NameEng, ApartmentReservation.Details,ApartmentReservation.UserName, ApartmentReservation.UserEmail, ApartmentReservation.UserPhone, ApartmentReservation.UserAddress
from ApartmentReservation
inner join Apartment on Apartment.Id=ApartmentReservation.ApartmentId
inner join AspNetUsers on AspNetUsers.Id=ApartmentReservation.UserId
end
GO
/****** Object:  StoredProcedure [dbo].[SelectTag]    Script Date: 8.7.2022. 19:08:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[SelectTag]
	@Guid uniqueidentifier
	as
	begin
	select * from Tag
	where Tag.Guid=@Guid
	end
GO
/****** Object:  StoredProcedure [dbo].[SelectTaggedApartment]    Script Date: 8.7.2022. 19:08:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	 create proc [dbo].[SelectTaggedApartment]
	@Guid uniqueidentifier
	as
	begin
	select * from TaggedApartment
	where TaggedApartment.Guid=@Guid
	end
GO
/****** Object:  StoredProcedure [dbo].[SelectTaggedApartments]    Script Date: 8.7.2022. 19:08:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 create proc [dbo].[SelectTaggedApartments]
 as
 begin 
  select * from TaggedApartment
end
GO
/****** Object:  StoredProcedure [dbo].[SelectTags]    Script Date: 8.7.2022. 19:08:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[SelectTags]
 as
 begin 
  select * from Tag
end
GO
/****** Object:  StoredProcedure [dbo].[SelectTagType]    Script Date: 8.7.2022. 19:08:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[SelectTagType]
 as
 begin 
  select * from TagType
end
GO
/****** Object:  StoredProcedure [dbo].[UpdateApartment]    Script Date: 8.7.2022. 19:08:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[UpdateApartment]
 @Address nvarchar(250),
 @Name nvarchar(250),
 @NameEng nvarchar(250),
 @Price money,
 @MaxAdults int,
 @MaxChildren int,
 @TotalRooms int,
 @BeachDistance int,
 @ApartmentId int
as
begin
update Apartment
set 
 Address=@Address, 
Name= @Name,
NameEng= @NameEng,
 Price=@Price, 
 MaxAdults=@MaxAdults, 
MaxChildren= @MaxChildren,
TotalRooms= @TotalRooms, 
BeachDistance=@BeachDistance 
where
 Apartment.Id=@ApartmentId 
 end
GO
/****** Object:  StoredProcedure [dbo].[UpdateApartmentPicture]    Script Date: 8.7.2022. 19:08:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[UpdateApartmentPicture]
 @Path nvarchar(250),
 @Base64Content varchar(max),
 @Name nvarchar(250),
 @IsRepresentative bit,
 @ApartmentPictureGuid uniqueidentifier
 as
 begin 
  update ApartmentPicture
set 
Path= @Path,
Base64Content=@Base64Content,
Name=@Name, 
IsRepresentative= @IsRepresentative
where
 ApartmentPicture.Guid=@ApartmentPictureGuid 
 end
GO
/****** Object:  StoredProcedure [dbo].[UpdateApartmentReservations]    Script Date: 8.7.2022. 19:08:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[UpdateApartmentReservations]
@ApartmentId int,
@Details nvarchar(1000),
@UserId int,
@UserName nvarchar(250),
@UserEmail nvarchar(250),
@UserPhone nchar(20),
@UserAddress nvarchar(1000),
@ApartmentReservationGuid uniqueidentifier
as
begin
update ApartmentReservation
set 
ApartmentId= @ApartmentId,
UserId=@UserId,
Details=@Details, 
UserName= @UserName,
UserEmail= @UserEmail,
 UserPhone=@UserPhone, 
 UserAddress=@UserAddress
where
 ApartmentReservation.Guid=@ApartmentReservationGuid 
 end
GO
/****** Object:  StoredProcedure [dbo].[UpdateApartmentStatus]    Script Date: 8.7.2022. 19:08:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	 CREATE proc [dbo].[UpdateApartmentStatus]
	@Id int,
	@UserId int,
	@StatusId int
	as
	begin
 IF EXISTS (SELECT 1 FROM ApartmentReservation WHERE ApartmentId = @Id)
 BEGIN
     UPDATE ApartmentReservation 
     SET UserName=(Select UserName from AspNetUsers WHERE AspNetUsers.Id=@UserId)
     WHERE ApartmentId = @Id;
	 UPDATE Apartment
	 SET StatusId = @StatusId
	 WHERE Apartment.Id = @ID;
 END
 ELSE
 BEGIN
     INSERT into ApartmentReservation(Guid, CreatedAt, ApartmentId, UserId)
     Values (NEWID(), GETDATE(), @Id, @UserId);
	 UPDATE Apartment
	 SET StatusId = @StatusId
	 WHERE Apartment.Id = @Id;
 END
	end
GO
