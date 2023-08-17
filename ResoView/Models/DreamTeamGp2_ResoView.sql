/*
 * Copyright 2023, Group 2
 * Harpreet Singh (8870943)
 * Pratharan Sai Rupak Reddy, Gondi (8876529)
 * Deepak, Mikkilneni Jeevarathnam (8850079)
 * Bhavna, Bhavna (8864264)
 */

DROP DATABASE IF EXISTS DreamTeamGp2_ResoView;
GO

CREATE DATABASE DreamTeamGp2_ResoView;
GO

USE DreamTeamGp2_ResoView;
GO

CREATE TABLE __MigrationHistory
(
    MigrationId    nvarchar(150)  NOT NULL,
    ContextKey     nvarchar(300)  NOT NULL,
    Model          varbinary(max) NOT NULL,
    ProductVersion nvarchar(32)   NOT NULL,
    CONSTRAINT [PK_dbo.__MigrationHistory]
        PRIMARY KEY (MigrationId, ContextKey)
)
GO

CREATE TABLE AspNetUsers
(
    Id                   nvarchar(128) NOT NULL
        CONSTRAINT [PK_dbo.AspNetUsers]
            PRIMARY KEY,
    FirstName            nvarchar(max),
    LastName             nvarchar(max),
    Email                nvarchar(256),
    EmailConfirmed       bit           NOT NULL,
    PasswordHash         nvarchar(max),
    SecurityStamp        nvarchar(max),
    PhoneNumber          nvarchar(max),
    PhoneNumberConfirmed bit           NOT NULL,
    TwoFactorEnabled     bit           NOT NULL,
    LockoutEndDateUtc    datetime,
    LockoutEnabled       bit           NOT NULL,
    AccessFailedCount    int           NOT NULL,
    UserName             nvarchar(256) NOT NULL
)
GO

CREATE UNIQUE INDEX UserNameIndex
    ON AspNetUsers (UserName)
GO

CREATE TABLE AspNetRoles
(
    Id            nvarchar(128) NOT NULL
        CONSTRAINT [PK_dbo.AspNetRoles]
            PRIMARY KEY,
    Name          nvarchar(256) NOT NULL,
    Discriminator nvarchar(128) NOT NULL
)
GO

CREATE UNIQUE INDEX RoleNameIndex
    ON AspNetRoles (Name)
GO

CREATE TABLE AspNetUserRoles
(
    UserId nvarchar(128) NOT NULL
        CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
            REFERENCES AspNetUsers
            ON DELETE CASCADE,
    RoleId nvarchar(128) NOT NULL
        CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
            REFERENCES AspNetRoles
            ON DELETE CASCADE,
    CONSTRAINT [PK_dbo.AspNetUserRoles]
        PRIMARY KEY (UserId, RoleId)
)
GO

CREATE INDEX IX_UserId
    ON AspNetUserRoles (UserId)
GO

CREATE INDEX IX_RoleId
    ON AspNetUserRoles (RoleId)
GO

CREATE TABLE AspNetUserLogins
(
    LoginProvider nvarchar(128) NOT NULL,
    ProviderKey   nvarchar(128) NOT NULL,
    UserId        nvarchar(128) NOT NULL
        CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
            REFERENCES AspNetUsers
            ON DELETE CASCADE,
    CONSTRAINT [PK_dbo.AspNetUserLogins]
        PRIMARY KEY (LoginProvider, ProviderKey, UserId)
)
GO

CREATE INDEX IX_UserId
    ON AspNetUserLogins (UserId)
GO

CREATE TABLE AspNetUserClaims
(
    Id         int IDENTITY
        CONSTRAINT [PK_dbo.AspNetUserClaims]
            PRIMARY KEY,
    UserId     nvarchar(128) NOT NULL
        CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
            REFERENCES AspNetUsers
            ON DELETE CASCADE,
    ClaimType  nvarchar(max),
    ClaimValue nvarchar(max)
)
GO

CREATE INDEX IX_UserId
    ON AspNetUserClaims (UserId)
GO

CREATE TABLE Products
(
    Id          int IDENTITY
        CONSTRAINT [PK_dbo.ProductModels]
            PRIMARY KEY,
    Name        nvarchar(max)  NOT NULL,
    Price       decimal(18, 2) NOT NULL,
    Description nvarchar(max)  NOT NULL,
    ImageUrl    nvarchar(max)  NOT NULL
)
GO

INSERT INTO DreamTeamGp2_ResoView.dbo.__MigrationHistory (MigrationId, ContextKey, Model, ProductVersion)
VALUES (N'202308130300178_CreateInitialIdentityTables', N'ResoView.Migrations.ResoViewDbInitializer',
        0x1F8B0800000000000400DD5CDB6EE338127D5F60FF41D0D3CC2263E7B2DDE80D9C19A49D6436D8DCD04E37F6AD414BB443B44469442A9D60315F360FF349FB0B4B4A9444F1224BB62C3B8B0106312FA78AC522AB58AAEAFFFEF1E7E4979730709E61425084CFDCA3D1A1EB40EC453EC2CB3337A58B9F3EB8BFFCFCD7BF4C2EFDF0C5F9528C3BE1E3D84C4CCEDC274AE3D3F198784F30046414222F8948B4A0232F0AC7C08FC6C78787FF181F1D8D2183701996E34C3EA598A210663FD8CF69843D18D31404B7910F0322DA59CF2C4375EE4008490C3C78E67E8224FA82E0F7513ED475CE0304181B33182C5C07601C51401993A79F099CD124C2CB59CC1A40F0F81A43366E01020205F3A7D5F0B6EB383CE6EB1857130B282F25340A3B021E9D08C18CD5E96B89D72D05C74477C9444C5FF9AA33F19DB9D73ECC9A3E450113804AF0741A247CF0997B5B923827F11DA4A362E22887BC4A18DCF728F93692110F9CD6F30E4A453A1E1DF2FF0E9C691AD034816718A63401C181F390CE03E4FD0BBE3E46DF203E3B399A2F4E3EBC7B0FFC93F77F8727EFE495B2B5B271B506D6F49044314C186F7051AEDF75C6F579637562394D9A934B85E9123B13AE730B5E6E205ED227765A8E3FB8CE157A817ED12294EB3346EC08B1493449D9CFBB3408C03C8065FFB89126FF7F03D5E377EF7BA17A079ED132DB7A853E3B38093B579F6090F5922714E7C7ABB6DF5FC5B0AB240AF9EFBA7EE5BD5F67519A787C319175C823489690D6B99B8C2BE56DA5D21CAA7FB52E50F75FB539A7BA7A1B87F205AD73120A12439F8682DFEDD26DAD71E771BC4AD1140B3512530E9CA2A35292A3B64A8219F3AEF3111028E4A01E47653926BEF90E76E49B4FD99CEFFFE3BBFA0A2584AEB8B0D99FAD483753BA010311BA0C010A7AB03F2DA830BF6F819210961BF73162AA0C70E76D780084B0EBD7FF27204F5B17D00C7A69C24ED78C8230DE3AB587A708C3BB349CF3C33B1CADDEB6E6F17B74053C1A259798CFDA18EF26F2BE4529BDC4FE05A0F033F50A40FEF31185ED017A61E7DCF32021574C99A13F8DD8B3A600BCC6F4E4B8331CBF7077EDFF4D038042B303284CC2D76248E5FCD57B34C74FE936397D4D2CDD444B849B592A86E82CE53D569644775796384833476284CE50D661E527EFEDCD2DCE24DEBF5F9CC1EEBF63BC991F613BC3921867EC6683BF420C1376FDF80F805298E06A07DA9CF75DF82DD9F671A25BB72919A52F2048FB26B5D669C80E7BFFA72183DDFFD390B1C99A9F91CFBD8916AFC56230836F35DEFC105D7DE614CE863E0EB5650E4D7C983BC0765CCE09893C949D02439C504479EAFC33DFCB591DF2B1BD536F99A2A398A9366B616B7355A5BAC7173080143AE75E1E479D02E2015F17235B90DF81B1C2A21A18ABC24775E6FEA6D1649A0E133E09F0C70B61271561AA1F0B843D148360A59494992D4D185F7B4943EDB98031C49CE04A49B4216E8E1671064A3ACAA6AC92D0642C695CB3222ADEA66DAF6DAE67B5CF65F06310DDB3F8BA16BD13FED95614CF2C990194CE2C823684AD91CC21154EBC25566DB0FAB0D8B5C2292F198BC2091768AB0A5797CC800A5717C19B51B8FCA9B86A7F9577E3AED5ADFE501DDEAC1AC532A0AED5D6BF67AA96FB7A6C0E65336052587311C8BF98F31EF8420D2F21C6A4780C11E157AA7AC0916790D6E3209573B9F2E3840144D59826C04AAB56808A0F941A50795A3A305504BC1AB912A6BC036C11B46A841517B6022B6DBC8E2D7FA09506DA3FE3AA1AD9CAC52F57566A81A6D9AD3C7209C7A008EACD545F780BA1A8414B5D204D8E661B57535A80107A83202CEEA1450805D3BD49A15039BB144CDE4F1BFF672D29283E8B450A05D3BD4941E8965D08068BDCC226AF2582BA1DEDE93014CFFDD204947D93719E54251A26634BF6D5E416C431C24B291B4BB438B33C156BFAD3AC7B9A5298638C3D62C8562AB92D29D128014BA8F432D28CD3ECDBEB05A0600E78B063EA87DA30DDE059EEE6829E6CD3F49D2B2EE96234FF5B5CBC84FF7DBFF841FD882E5F7B3F1ABC040175C556197217238B271B7420B378DA748767C88100248610F6340AD210DB3D1EFBECFC03943C3F6FD1112663857FCDB3D184D645AA964C8AFD1323D32E1F657E7D16E996D244E4E9178878090A11068CBB3D1067B350F64EA6758F7250C116FDD54DD1EA1ED12FF03EB6AB7480D7DF323B846DDB8AB78B2C76DB7BC68E52841365145B887167BB66F3883BDD53D90BA3FB0659676EE7A697D2976410A9B93D5695A0244355ADED914406920C239A3A6248492C1A98D4D71EB59E672463D67BDA232AC94432A4D2D5814B3965A8C6A4DCB1169E45A2E611ED29E8494232BADEDB412BF574A19A7AEADD6B601B7856FBDAA31A328A646043777BEC2ABD48BDC7B7E5E1F56039ADAFF2F54C671EA5D9CC765A30B67349F7637AA58C0F19486AEE8825723A3430D1BE97AA640D6DACA74A79646E3355B260D8EF9C5AA244FDCA69CCEEB063D6B21F6AD77A53F6871DAF9BC26E552DB430883AA4A45E864394B0C74484205657A66931897C88EB14626426FD9550188EF880D1ECB7601A20C82FF062C02DC0680109CD337EDCE3C3A363A5BE6D7F6ACDC684F8812184632B38ABEFD900C97BF81924DE1348F4549A0DEAB12A50EDC3C935F6E1CB99FB9F6CD66916E3E37F65CD07CE35F98CD16F29EB784C52E8FCAEA7F476E44A79F36EB4E63EEBAD4A31FCFE260A99DA6FE8F5BFBFE6530F9CFB841DD653E750D9C67594AB5EDED4899B7CEA06DC74297AD25FA56FEA0C6B753A05F20F2178F951865BA7166723B05ABD8D71C1CAF5B07E79CD1CD15E4A6B365AAFB17C66234443894C5F78BD88D05602B30E96B5FCC5673F6956FED251978DE530EBB0662D8541B83B985A08D3FE662C66F6637837A8B918FCB6CCE4BCB22061A3ECE45D9B4BAD6E61A383AED7267480EBB5FE6033AFE98DE5F5F766D50D69FBBD61EF52EFB79EABBF2FE9F9D53B62B759F94326E2377CBE7BD3F9F73BCC483524E1ED2EDB7E685DB2C5B3F734D5B95D6EFD9E289330D7BBCBA41F5A996C11ED3D55A65679F37BA24BBBB2733BD2A4D6266EE759F17A2EA1E5BB9229ACBD2AF13DFF06C09EE7F3886D7EEEF1E5C5C1E68C4E1BB14A49AC04AB2176A2F6545295707950347A654F33996E6B1386B97171624C33594BC274136D718F37D216639A695BD2947791AA6F4C2436954DACB8AF9A92C7F63135BFC6B1A5D26395EFD8F8D17F1F33F1375A744DFB2D9FA7F72FF17EA325F7A9DA1D12EDF52FC9CC9649FF122AB3A7042D2B089E028BA157B362E5986BBC880A63AA70540C51221AB790029F99B8F384A205F028EBE601DBEC5F1B1029B697E11CFAD7F83EA5714AD99261380F6A01226E949BE867D504759E27F771F60FE4F4B104C626E281EE7BFC3145815FF27D6588A15820B8B517E151BE9794874997AF25D25D845B0209F1954ECA230CE38081917B3C03CF701DDE98FADDC025F05EAB88990D64F546D4C53EB94060998090088C6A3EFBC974D80F5F7EFE1F14E49D9F10580000,
        N'6.4.4');
INSERT INTO DreamTeamGp2_ResoView.dbo.__MigrationHistory (MigrationId, ContextKey, Model, ProductVersion)
VALUES (N'202308150146010_AddProductsTable', N'ResoView.Migrations.ResoViewDbInitializer',
        0x1F8B0800000000000400DD5CDB6EE338127D5F60FF41D0D3CC2263E7B2DDE80D9C19A49D6436D8DCD04E37F6AD414BB443B44469242A9D60315F360FF349FB0B4B4A942CDE64DD2C2B8B0106312FA78AC543B24855F57FFFF873F6CB8BEF59CF308A5180CFECA3C9A16D41EC042EC2EB333B21AB9F3ED8BFFCFCD7BFCC2E5DFFC5FA92B73B61ED684F1C9FD94F8484A7D369EC3C411FC4131F395110072B3271027F0ADC607A7C78F88FE9D1D11452089B6259D6EC538209F261FA83FE9C07D881214980771BB8D08B7939AD59A4A8D61DF0611C02079ED99F601C7C41F0FB246B6A5BE71E02548D05F456B605300E082054C9D3CF315C9028C0EB45480B80F7F81A42DA6E05BC1872E54F37CDEB8EE3F0988D63BAE9984339494C02BF21E0D10937CC54EEDECABC7661386ABA4B6A62F2CA469D9AEFCC7E88023771486A37DB92059ECEBD8835562C3C29F73BB0F2DA83820D9434ECBF036B9E782489E019860989006DFB902C3DE4FC0BBE3E06DF203EC389E79555A44AD23AA180165171218CC8EB27B8E28A5FBBB63515FB4DE58E45B7529F6C38D7989C1CDBD61D150E961E2C18501AFA820411FC1562180102DD0740088C30C380A90D15E9922CF6FF5C1AA51C5D3AB6750B5E6E205E93A7339BFE695B57E805BA7909D7E0334674A5D14E244AA046C36AA90F11720AB117D0413EA0D3FA10D1BFF862FE605B0B073040DDF8ABD12F60EC4428CCA8B8DBA1CDA61BAA5612389F8F4F8107AB087C5BAC91F338BC836492779C6490571185FB1E44DF2665C403AB76BF0DF78FEB72FFE468B93AF9F0EE3D704FDEFF1D9EBC1B7E1D68A6EFE8F8C32E98B9653D1CBF7BDF8BD43BF08CD6E9D44BF2E9CE1FD183E113F4D2DAF80985D9F920CCF757DEEC2A0A7CF65BE45756FB75112451BACA0263934710AD21E9486906D53FAD73D4F1539B69AAD25BDB940DA8CD4AC8450CBD1A727D772BB736E3CEC3701BD164078077E97EF65B1F410CB91DE4E5280D47A7379BC1867AB32E6FD067198E9D57288A494F0E4CB5A41B3090A04B1F20AF87F3A786147A7159A1C887C5C47D0C2895016EEECC8138A6DBAFFB4F103FEDDC400BE824115D5D0B02FC70E7D21E9E020CEF127FC916EF70B27A9B9AC7EFC11570E80DE112B35E9DF16E02E75B90904BEC5ED0DBC667E2143E3CFDF988FCFA00BDA873EE38308EAF2899A13B0FE8BD7CDBBDA91A8E6DB8FBF6FFE61E40BEDE01E447C2D7BCC9C6F9136B14C74FAAD6397D552ADD046B84AB55CA9BA82A65354695787553951848B546BC85AA505A61D427ABEDCD2D4E2DDEBF5F9CC28EDF311EFBDBC7BEBCEA74FA98D09D9F29A9A42FC04BFA16D56A35A48BBDFFD590C28E7F35A46AD2E267E4326FA2C66D316F4CE16BB5D75F44B7AF3949B3A1978330CCA1850FB3079896CB791C070E4A5781E69D90BFF288FA53DFCBDAFEE463BAA7DE52A2A390529B96D0B1D932A9EEF105F42081D6B9937D089883D801AE6A463A20B78162F989AA516CF37C242AF7374526653A8C5827C02E2F315DA90813755920ECA010785BAD24F5AC7984B1B11732E49A0B1842CC046EB5441DE1FAD722A64021479A946D169A4D4B8CAB26A2E46D9AE6DAE47A6EE6B978FC18847B065FD7C03BEE9FED84787ACB0C403ABD09EA0836BE640E49387E97D836C1F2C562DF84936E3206C2711768A784132D3320E14413BC19C26557C56DF32BDD1BF74D37F1A23AFCB1AA35CB805C13C63F32AA65BE1EED43680F18E5A7397FC8BF58B21AF842343721AA24BF0CC5DCAF9479C090179068C22262DBDA38999C0C62D8C4B41A8C3F992820E62F1D1A10997E55801B8A6E01E55F3B15A062E935502A7F3DABD48AFB050D60F317B04A58BEFB4BB02516A9D8E5AFBDA586E66FC232BD6BDD178A91152C5096492DF7BE84A32182BCCD8903AF6114F90554354895D75AC76F2D0D801BBDC210065FD360845CE9DEAC9053CE6C059D2B55C7996A6505C90132582157BA372B706E998DA039DE6B1CF0AD4C201ECA3D2D86FCEDA0384F8ABAD9340B31E405B3A9211671760BC210E17529369197588B2C3071FED3A279D09E9F614C9D5813BB57685B48224104D650AAA5A2A9A6E987DC0B40C012B09793B9EB2BCDD4D3D3B037E7F27407A43A83F9669DF7627F8BC7B52E9250E37070802B3A469F792BE9D3748901D5DD2D162D0A3C10695EC3E78197F8D8EC3C997B67DFB2CAFDB392FA083C4EAF0CC18BEA6308D1786524A142C59B4D259B2A8E9B327D8A1B2D72A216634CDB859929D731FBFB7EF5834C99F241F9630BCE088ED7E838D3757E1AAEBF3CF6677466A4FB918BD26B65FAA1A514A524901D31B2FB0803AADD08CC596D94D1D954BC830C6AD896FB887AE4F7315DC595A9FD9499214CD3965F9DCB66375DA7CD28F96B7619C5F4C2BDB75933DDA11AED53E99DB4F904197BEE66A72F45CF95414AC5F5B136F17165A84D697D241E005786E1450D314A31540A58A9AE812F2484B9092E9150531F518A652B434A550DB42C47AC094A962B5AE1192CAA6F515F821AA35646576B1BB0528D5613E8A956B7C0D6E82CD7D547D504B4958135D5F5B137D16DF23EBE2B0FAF8793D3F88ED3EEE8CCDEF5BA9D9D068CDD6CD2FD1CBDA580A33250A9B821160F2952C078F928A9647C0C6B47A5EC2DB71B950C18E63D4788D311B79CCAE02233A6107C23DEF32B828FCC78CD08BB535A280F677293427AF180263D94CDF8A3D5F6CC5EE5152B6BC2721A3333D223FD3526D09FB00693C56FDEDC43906DE079835B80D10AC6240B38B38F0F8F8EA5FCE0F1E4EA4EE3D8F5348F7EA6845D71CE06881D45CCB25BA3433BA406E26710394F20FAC1072F3F764B7F7507487F6DA26EBB94D6C1A7381F921AACD7C3B46A3ECD5E6317BE9CD9FF497B9DA60FFFECAFB4F8C0BA8E3F63F45B422B1EA3045ABFAB49034D27517CD6E834E63E333A0B33FCFE265225EB4FE8F5BFBF665D0FACFB88EEC7A7D6A1348D6DC825265036D226EBDA419B266995EAC3C39B5AC34A26A071C36B93EDD7094CC8E8D30E58DA1EDA27F02D11E92579AFD378B5097A9D103549787DE1F5624253925D1B2C63829D4B7F9234C1AE2197B509776D543326DBA5CE56C754BBFA3B63DEB39F83B74356D7FF87533BAEE352C98CEAB4D0D5ECA70670BD663875F39ADE58E6506FA7BA2631A837EC7DF27EE7D940634900DADC23F69BF73364AA4FC517DA379DE1B3C798774D64EEFEF27986E692E993C5489329EA65EF8C844CFCB8DE5FAECED064327DB41829996A65E68C844BFB3AE7F6C4A4DA47DCDEF36ED40063793ACD39355B536AB2CF3CF47ABE0CE8E4671E9F949453338924A388224EACD689CBFEB5037D54B949D8869346819B2666A1E670765970B12E1579454DB5986663E37E40E5E0789B6AB186A48D2AD9FCD8A894CDDB54CB36A44AEC235D489BCCA04BDDDAB23D5685238E313D48D0D8906DB6CD55AD0C2319633650A7410BEC37043C8C2FF9A7D390FBA47683641F3536811E9DA57F9B9C1EDF315A6F20585035868E7068166DAEF12AC8CF6E49A3BC89F480720B0970E9897A1E11B4020EA1D5EC7D38FDE75378D0F6A5BF84EE35BE4F4898103A64E82F3DE13D8AF90055F2D38C2651E7D97DFA613BEE6308544DC4DED5EFF1C704796EA1F795E6C9C600C19C0BFE1ACBE692B057D9F56B817417E09A40DC7C854FF408FDD0A360F13D5E8067D846374ABF1BB806CEEBE681CE04B27D2244B3CF2E105847C08F39C6A63FFD4939ECFA2F3FFF0F444B868AA25F0000,
        N'6.4.4');
INSERT INTO DreamTeamGp2_ResoView.dbo.__MigrationHistory (MigrationId, ContextKey, Model, ProductVersion)
VALUES (N'202308160328395_AddImageUrlColumnToProductsTable', N'ResoView.Migrations.ResoViewDbInitializer',
        0x1F8B0800000000000400DD5CDB6EE338127D5F60FF41D0D3CC2263E7B2DDE80D9C19A49D64D6D8DC10278D7D6BD012ED102D511E894A2758CC97CDC37CD2FEC2921275E14D962C595616030C625E4E158B876491AAEAFFFEF1E7E49757DFB35E6018A1009FD947A343DB82D8095C845767764C963F7DB27FF9F9AF7F995CBAFEABF5256B77C2DAD19E383AB39F09599F8EC791F30C7D108D7CE48441142CC9C809FC317083F1F1E1E13FC647476348216C8A655993871813E4C3E407FD390DB003D72406DE4DE0422FE2E5B4669EA05AB7C087D11A38F0CC7E8051F005C1EFA3B4A96D9D7B085035E6D05BDA16C038208050254F9F223827618057F3352D00DEE3DB1AD2764BE045902B7F5A34AF3B8EC363368E71D1318372E288047E43C0A3136E98B1DC7D2BF3DAB9E1A8E92EA989C91B1B7562BE33FB3E0CDCD82189DD6C4B16783AF542D658B1F0A8DCEFC0CA6A0F723650D2B0FF0EAC69EC9138846718C62404B4ED7DBCF090F32FF8F6187C83F80CC79E5756912A49EB84025A44C5AD6148DE1EE0922B3E736D6B2CF61BCB1DF36EA53EE97066989C1CDBD62D150E161ECC19501AFA9C0421FC1562180202DD7B40080C31C380890D15E9922CF6FF4C1AA51C5D3AB675035EAF215E91E7339BFE695B57E815BA5909D7E00923BAD2682712C650A361B5D4FB1039B9D80BE8201FD069BD0FE95F7C317FB2ADB90318A06EFCD5E817307242B44EA9D8F7D0663E58C1A7D0DBB5E4C9B85824954B2763C243E0C1AAA57393AFCEF3687D0BC928EB384A21AF420AF73D08BF8DCA880756ED7EC5AA3BAEBBEA4E8E16CB934F1F3E02F7E4E3DFE1C987FE57A066FA8E8E3FED82381B56E2F1878F9D48BD052F68954CBD249F9E39213D921EA097D446CF689D9E4CC27C7FE5CDAEC2C067BF457EA5B55FE7411C26EB3B30367904E10A9296946650DDD33A431D3EB599A62ABDB54DD980B659099988BE5743A6EF6EE5D666DCF97ABD8968B2EBC1BBB4F73AACCF2082DC0EF2729486A3D39BCD6043BD599777E82DF5C7CE2B1446A423D7A95AD235E849D0A50F5095D352F7FCA921855E999628F4613E719F034A65809BBB91208AE8F6EBFE1344CF3B37D01C3A714857D79C007FBD7369F7CF0186B7B1BF608BB73F599D4DCDE3F7E00A38F46E728959AFD678D781F32D88C925762FE83DE78938F9ED81FE7C447E7D804ED439771C18455794CCD09D0631269B6E6CD5706CC3DDB7FF37F500F2F50E203F12BE664D0AE74FAC511C3FA95AE7F455A9741DAC10AE56296BA2AA94D61855E2D54D556220D51AF116AA424985519FB4B633B738B178F77E71023B7CC778E8AF2EFBF2AA93E96342777EA62492BE002FEE5AD456AB2159ECDDAF860476F8AB21519316BF20977913356E8B59630A5FABBDFE22BA79CD499AF5BD1C8461F62DBC9F3DC0B45CCEA3287050B20A34EF84FC9547D49FFA5ED6E6271FD33DF586121DAD29B569091D9B2D93EA0E5F400F12689D3BE9278829881CE0AA66A403721B28969DA81AC58AE72351B9BF293229D361C83A01767989E84A4598A8CB026107AD81B7D14A52CF9A47181B7B2E43AEB9806B8899C08D96A8235CFF5AC414C8E54893B2C94293718971D54494BC4DD35C9B5CCF629EF3C78F5EB867F0750DBCE3FED94E88A7B74C0FA4D39BA08E60E34B669F84E377894D132C5F2CF64D38E92663201C7781764A38D1323D124E34C1BB215C7A55DC34BFD2BD71DF74132FAAFD1FAB5AB3F4C83561FC03A35AEAEBD13E84F68061769AF387FC8B05AB81AF447313A24AF2CB50C4FD4A99070C790E89189011D956E15F721E88B11AE36A1CFE5AA280983F72684064E6550116ECDC00CA3F742A40F9AA6BA054F67056A91577091AC0668F5F95B07CE397604B0452B1CB1F7A4B0DCD9F836566D7BA2AE423CB59A0AC905A9E7D09474304798713075EC328F2E3A76A902A87B58ECB5A1A00377A85210C6EA6C10899D29D5921A39CD90A3A2FAA8E1FB5951524DFC760854CE9CEACC0B9653682E664AF71B66F6502F13CEE683164CF06F95192D74DC6695C232F988C0D0190931BB05E23BC2A0544F2126B9E46434E7F9A378F14F4538CB113690206736D73492408C10A4AB55434D534F9867B01085800F66832757DA5997A701AF6E64C9E7436AA9397EDD35907F6B77848EB2217356E0607B8A2C3F3998F923C489726BFBABBC5A253810742CD1BF834F0621F9B5D2673EFF40B56B97F5A521F81C705962178517D0C21FAAF8C2454D4C72B02FA04CBE4A52AD2642CCD8EE2F8294450DC709158B56867DA73CC9C9B45ECEFBBE50F32F9CAA7ED8F5BB04FF0DE06C7BEB6F3D3702567B143833323DDD45C945C4B930F35A5282761D920B66C7C8401D56E00E6AC36CAE06C2A5E647A35EC96FB88EA3774315DF9BD6BFB29334398A62DBB7A97CD6EBA8E9B51B2D7F0328AE9857C6FB366BA8835DAA7928B6DF30932F6DCCD4E5F8ABE2B83948AEB6315F17565A8A2B43E120FA02BC3F0A28618A5182C05AC54D7C0AB12C2E404E74AA8A98F28C5C29521A5AA065A9623DE0425CB155BE1192CAA6F515F821AE35646576B1BB0528D7613E8A9566F81ADD159AEAB8FAA09882B036BAAEB6317D171F23EBE2B0FAF8393D3F818B4DDD1993E0EB63B3B0D18BBD9A4BB397A4B014B65A05271432C1E92A480F1F24152C9F8A2B61D95D207E17654326098F71C21CE47DC722A8393CC9842F08EF8625011BC64C66B46D89DD242797D939BE4D2F35738E9B56DC25FBE36E7242B4F616913968D999A911EE96F1181FE883518CD7FF3A61E826C03CF1ADC008C96302269C09A7D7C78742C65360F27CB781C45AEA7793934A51A8B73D643EC296296DD185DDA22B510BF80D07906E10F3E78FDB15DE2AEDB43E26E3B75E564DC2668DB25D8F64E986C486AE8600724D17C289E6117BE9ED9FF497A9D26DF22D85F49F181358B9E30FA2DA6158F610CADDFD51486A694101F495A8DB9CBFCD2DC0CBFBF8BC4CDFA133AFBF7D7B4EB817517D2DDFDD43A94A6711B7289E99C8DB449BBB6D0A64992A7FA8CF1AED6B0929768DCF0B6C93D6C0526E4176A072C6D0FDBA7132E10E92495B0D578B5E982AD103529815DE175624253CADF3658C6743F97FE2449BA5F432E6BD3FFB651CD98FA97B86E2D13FFEAEF8C59CF6E0EDE163966FF1F2EF2B08E4B254FABD5425773B11AC0759A6FD5CE6B7A67794C9D9DEA9A34A5CEB0F7C9FB9DE7260D251DA9B847EC370BA9CFC4A38AEFBDEF3ADF688F11F89A60E1FD6517F5CD25D3079081A676D4CB251A0899F871BDBFCCA1BEC964FA04325032D5CA131A0897F675CEED8949B58FB8BD6701A931CFF2746A337C781A4FE1A969B37CD28F46F47ABE08E8E4A71E5FB9851A7B2E8B13DD33459C58AD1397FEDB0BFA407793B0829346814513B3507384BD2C385F978ABCBCA65A4CB3B1713FA07270BC4DB558431E49956C7E6C54CAE66DAA651BB237F691C1A4CDAFD065936DD81EAB821B8798B124686C4880DBE4AA5606A50C3141A9D5A005F61BC22786978FD46AC85D52BB41FE911AE9408FCED2BFD14E8FEF08AD0A0816A28DA1231C9A799B195E06D9D92D699435911E506E20012E3D51CF438296C021B49ABD0F27FF980B0F01BFF417D09DE1BB98AC6342870CFD8527BC47311FA04A7E926425EA3CB94B3E93475D0C81AA89D8BBFA1DFE1C23CFCDF5BED23CD918209873C15F63D95C12F62ABB7ACB916E035C13889B2FF7891EA1BFF628587487E7E0056EA31BA5DF355C01E7AD78A033816C9E08D1EC930B045621F0238E51F4A73F29875DFFF5E7FF01957D2A68AA600000,
        N'6.4.4');
INSERT INTO DreamTeamGp2_ResoView.dbo.AspNetRoles (Id, Name, Discriminator)
VALUES (N'de899b6b-605f-4c80-9ec8-90a95e50a51e', N'admin', N'AppRole');
INSERT INTO DreamTeamGp2_ResoView.dbo.AspNetRoles (Id, Name, Discriminator)
VALUES (N'f38888f8-667f-48f2-8cc6-55b0b01b1d14', N'member', N'AppRole');
INSERT INTO DreamTeamGp2_ResoView.dbo.Products (Name, Price, Description, ImageUrl)
VALUES (N'Camera', 899.22, N'A nice camera',
        N'https://cdn.pixabay.com/photo/2014/04/17/23/26/environmental-protection-326923_1280.jpg');
INSERT INTO DreamTeamGp2_ResoView.dbo.Products (Name, Price, Description, ImageUrl)
VALUES (N'Optoma HD146X', 599.99,
        N'The Optoma HD146X delivers stunning Full HD 1080p resolution and vibrant colours',
        N'https://cdn.pixabay.com/photo/2023/08/06/19/01/colvers-8173610_1280.jpg');
INSERT INTO DreamTeamGp2_ResoView.dbo.Products (Name, Price, Description, ImageUrl)
VALUES (N'Epson Home Cinema 5050UB', 2799.00,
        N'The Epson Home Cinema 5050UB boasts 4K PRO UHD resolution HDR support and advanced 3LCD technology for impeccable colour accuracy',
        N'https://cdn.pixabay.com/photo/2015/12/01/20/28/road-1072821_1280.jpg');
