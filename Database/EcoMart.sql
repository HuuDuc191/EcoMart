CREATE DATABASE EcoMart;
GO

USE EcoMart;
GO
 select * from Account
 select * from Customer
 select * from Token_Table
 select * from Staff
  delete Account
  delete Customer
  delete Token_Table
 INSERT INTO Account (Username, [Password], Email, Phone, [Role], [Status])
VALUES

('admin', 'admin123@', 'admin@fpt.edu.vn', '0123456789', 1, 'Active'),
(N'Trương Thác Nhã', 'Nha123@',  'thacnha@ecomart.vn', '0909123456', 2, 'Active'),
(N'Trần Mẫn Tuệ', 'Tue123@', 'mantue@ecomart.vn', '0912345678', 2, 'Active'),
(N'Lê Trường Sinh','Sinh123@', 'truongsinh@ecomart.vn', '0923456789', 2, 'Active');

CREATE TABLE Account (
    AccountID INT PRIMARY KEY IDENTITY(1,1),
    Username NVARCHAR(100) NOT NULL UNIQUE,
    [Password] NVARCHAR(255) NOT NULL,
    Email NVARCHAR(255) NOT NULL UNIQUE,
    Phone VARCHAR(15),
    [Role] INT NOT NULL, -- 0: Customer, 1: Admin
    [Status] NVARCHAR(255) -- trạng thái tài khoản: Active, Inactive,...
);


INSERT INTO Account (Username, [Password], Email, Phone, [Role], [Status])
VALUES
(N'nguyenvana', N'pass123', N'nguyenvana@gmail.com', '0909123456', 0, N'Active'),  -- Khách hàng 1
(N'tranthib', N'pass456', N'tranthib@gmail.com', '0918234567', 0, N'Active'),    -- Khách hàng 2
(N'levanc', N'pass789', N'levanc@gmail.com', '0987345678', 0, N'Active'),        -- Khách hàng 3
(N'admin123', N'adminpass', N'admin@ecomart.vn', '0938123456', 1, N'Active');    -- Admin

CREATE TABLE Customer ( 
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    AccountID INT UNIQUE, -- liên kết với bảng Account
    FullName NVARCHAR(100),
    [Address] NVARCHAR(255),
    FOREIGN KEY (AccountID) REFERENCES Account(AccountID)
);


INSERT INTO Customer (AccountID, FullName, [Address], Balance)
VALUES
(1, N'Nguyễn Văn A', N'123 Lê Lợi, Q.1, TP.HCM', 150000.00),  -- Khách hàng 1
(2, N'Trần Thị B', N'45 Nguyễn Huệ, Q.3, TP.HCM', 50000.00),   -- Khách hàng 2
(3, N'Lê Văn C', N'78 Trần Phú, Q.5, TP.HCM', 300000.00);      -- Khách hàng 3

CREATE TABLE Staff (
    StaffID INT PRIMARY KEY IDENTITY(1,1),
	AccountID INT ,
    FullName NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(20),
    Gender NVARCHAR(10),
    [Role] NVARCHAR(50), -- Ví dụ: 'Nhân viên bán hàng', 'Quản lý kho'
    [Address] NVARCHAR(200),
    [Status] BIT DEFAULT 1, -- 1: đang làm, 0: nghỉ
    CreatedAt DATETIME DEFAULT GETDATE(),
	FOREIGN KEY (AccountID) REFERENCES Account(AccountID)
);

INSERT INTO Staff (FullName, Email, Phone, Gender, [Role], [Address])
VALUES 
(N'Trương Thác Nhã', 'thacnha@ecomart.vn', '0909123456', N'Nữ', N'Nhân viên bán hàng', N'12 Lý Thường Kiệt, Q.10, TP.HCM'),
(N'Trần Mẫn Tuệ', 'mantue@ecomart.vn', '0912345678', N'Nữ', N'Quản lý kho', N'45 Phan Đình Phùng, Q.Phú Nhuận, TP.HCM'),
(N'Lê Trường Sinh', 'truongsinh@ecomart.vn', '0923456789', N'Nam', N'Nhân viên giao hàng', N'87 Nguyễn Trãi, Q.5, TP.HCM');
(N'Trương Thác Nhã', 'thacnha@ecomart.vn', '0909123456', N'Nữ', N'Nhân viên bán hàng', N'12 Lý Thường Kiệt, Q.10, TP.HCM'),
(N'Trần Mẫn Tuệ', 'mantue@ecomart.vn', '0912345678', N'Nữ', N'Quản lý kho', N'45 Phan Đình Phùng, Q.Phú Nhuận, TP.HCM'),
(N'Lê Trường Sinh', 'truongsinh@ecomart.vn', '0923456789', N'Nam', N'Nhân viên giao hàng', N'87 Nguyễn Trãi, Q.5, TP.HCM');

CREATE TABLE Token_Table (
    TokenID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT NOT NULL,
    Token NVARCHAR(255) NOT NULL,
    [Status] NVARCHAR(50) NOT NULL, -- 'unused', 'used', v.v.
    Time_Add DATETIME NOT NULL,
    Time_Exp DATETIME NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID) ON DELETE CASCADE
);

INSERT INTO Token_Table (CustomerID, Token, [Status], Time_Add, Time_Exp)
VALUES
(1, 'ABC123XYZ', N'unused', '2025-05-20 22:00:00', '2025-05-20 22:05:00'),  -- Token cho Nguyễn Văn A
(2, 'DEF456UVW', N'used', '2025-05-20 22:02:00', '2025-05-20 22:07:00'),    -- Token cho Trần Thị B
(3, 'GHI789RST', N'unused', '2025-05-20 22:03:00', '2025-05-20 22:08:00');  -- Token cho Lê Văn C

-------------------------//-------------------------


CREATE TABLE Supplier (
    SupplierID INT PRIMARY KEY IDENTITY(1,1),
    BrandName NVARCHAR(100),
    NameSupplier NVARCHAR(100),
    [Address] NVARCHAR(255),
	[Email] NVARCHAR(255),
    [Phone] VARCHAR(15),
    [Status] NVARCHAR(100) -- ví dụ: 'Đang hợp tác', 'Ngưng hợp tác'
);

INSERT INTO Supplier ( BrandName, NameSupplier, [Address], [Email], [Phone], [Status]) VALUES
(N'Thịnh An', N'Công ty Thịnh An', N'123 Lê Văn Việt, TP. Thủ Đức, TP.HCM', N'thinhan@fruit.vn', '0909123456', N'Đang hợp tác'),
(N'SUNTORY PEPSICO', N'Công ty TNHH Nước giải khát SUNTORY PEPSICO Việt Nam', N'Sun Avenue, Quận 2, TP.HCM', N'contact@suntorypepsico.vn', '02838912345', N'Đang hợp tác'),
(N'Mondelez Kinh Đô', N'Công ty cổ phần bánh kẹo Mondelez Kinh Đô', N'138-142 Hai Bà Trưng, Quận 1, TP.HCM', N'info@mondelezkinhdo.vn', '02838212345', N'Đang hợp tác'),
(N'Vinaquick', N'Công ty Vinaquick', N'45 Nguyễn Văn Cừ, Quận 5, TP.HCM', N'support@vinaquick.vn', '0918123456', N'Đang hợp tác'),
(N'IFREE BEAUTY', N'CÔNG TY TNHH IFREE BEAUTY', N'18A Cộng Hòa, Quận Tân Bình, TP.HCM', N'cs@ifreebeauty.vn', '02839451234', N'Đang hợp tác');

---------------------------//-----------------------

CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY IDENTITY(1,1),
    CategoryName NVARCHAR(100) NOT NULL,
    ParentID INT,
    FOREIGN KEY (ParentID) REFERENCES Categories(CategoryID)
);

INSERT INTO Categories (CategoryName, ParentID) VALUES
(N'Nước giải khác', NULL),
(N'Nước ngọt', 1),
(N'Nước trà', 1),
(N'Nước suối', 1),
(N'Nước yến', 1),
(N'Nước ép trái cây', 1),
(N'Trà dạng gói', 1),
(N'Cà phê gói', 1),
(N'Sữa các loại', NULL),
(N'Sữa chua', 2),
(N'Sữa chua uống men', 2),
(N'Sữa đặc', 2),
(N'Sữa tươi', 2),
(N'Phô mai', 2),
(N'Ngũ cốc', 2),
(N'Trái cây các loại', NULL),
(N'Bánh kẹo các loại', NULL),
(N'Snack', 4),
(N'Bách bông lan', 4),
(N'Bánh tươi-Sandwich', 4),
(N'Bánh quế', 4),
(N'Bánh que', 4),
(N'Kẹo singum', 4),
(N'Kẹo cứng', 4),
(N'Kẹo dẻo-Kẹo marshmallow', 4),
(N'Rau câu', 4),
(N'Trái cây sấy', 4),
(N'Mẹ và bé', NULL),
(N'Sữa tắm - Dầu gội cho bé', 5),
(N'Nước giặt - xả cho bé', 4),
(N'Bình sữa - núm vú', 4),
(N'Mỹ Phẩm', NULL),
(N'Nước tẩy trang - bông tẩy trang', 6),
(N'Sữa rửa mặt', 6),
(N'Mặt nạ', 6),
(N'Kem chống nắng', 6),
(N'Sữa tắm', 6),
(N'Son', 6);

---------------------//------------------------

CREATE TABLE Product (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductName NVARCHAR(255),
    Price DECIMAL(10,2),
    [Description] NVARCHAR (MAX),
    Quantity INT,
    [image] NVARCHAR(255),
    Unit NVARCHAR(50), -- đơn vị tính: kg, chai, gói,...
    CreatedAt DATETIME DEFAULT GETDATE(),
    CategoryID INT,
    SupplierID INT,
    [Status] NVARCHAR(50), -- 'Còn hàng', 'Hết hàng'
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID),
    FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID)
);

-- Giả sử SupplierID = 1 đã có trong bảng Supplier
INSERT INTO Product (ProductName, price, [Description], Quantity, [image], Unit, CategoryID, SupplierID, [Status])
VALUES
(N'Coca-Cola Lon 330ml', 8000, N'Nước ngọt có ga', 100, 'coca.jpg', 'Lon', 1, 1, N'Còn hàng'),
(N'Táo Mỹ', 35000, N'Táo nhập khẩu từ Mỹ', 50, 'tao.jpg', 'Kg', 3, 3, N'Còn hàng'),
(N'Kẹo Socola M&M', 25000, N'Kẹo socola viên nhiều màu sắc', 70, 'mm.jpg', 'Gói', 3, 3, N'Còn hàng'),
(N'Sữa tắm Johnson Baby', 45000, N'Sản phẩm dịu nhẹ cho bé', 30, 'johnson.jpg', 'Chai', 4, 4, N'Còn hàng'),
(N'Son môi Maybelline', 120000, N'Son lì bền màu', 20, 'son.jpg', 'Thỏi', 5, 5, N'Còn hàng'),
(N'Xoài tứ quý', 27000, N'Xoài Tứ Quý tươi ngon, ngọt đậm vị, nguồn gốc miền Tây', 10, N'xoai-tu-quy.jpg', N'kg', 2, 2,  N'Còn hàng')

CREATE TABLE Review (
    ReviewID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT,
    ProductID INT,
    Rating INT CHECK (rating BETWEEN 1 AND 5),
    Comment TEXT,
    [image] NVARCHAR(255),
    created_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

INSERT INTO Review (CustomerID, ProductID, Rating, Comment, [image], created_at)
VALUES
(1, 1, 4, N'Sản phẩm ngon, giao hàng nhanh!', 'review_coca.jpg', '2025-05-20 14:00:00'),  -- Nguyễn Văn A đánh giá Coca-Cola
(2, 3, 5, N'Kẹo rất ngon, đóng gói đẹp!', 'review_mm.jpg', '2025-05-20 15:30:00'),       -- Trần Thị B đánh giá M&M
(3, 5, 3, N'Son màu đẹp nhưng hơi khô', 'review_son.jpg', '2025-05-20 16:15:00');         -- Lê Văn C đánh giá Son Maybelline


CREATE TABLE Cart (
    CartID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
);

CREATE TABLE CartItem (
    CartItemID INT PRIMARY KEY IDENTITY(1,1),
    CartID INT,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL DEFAULT 1,
    FOREIGN KEY (CartID) REFERENCES Cart(CartID) ON DELETE CASCADE,
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID) ON DELETE CASCADE,
);

CREATE TABLE Orders (
    OrdersID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT,
    OrderDate DATE DEFAULT GETDATE(),
    Total_amount DECIMAL(10,2),
    [Status] NVARCHAR(100), -- 'Chưa thanh toán', 'Đã thanh toán', 'Đã hủy'
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

INSERT INTO Orders (CustomerID, OrderDate, Total_amount, [Status])
VALUES
(1, '2025-05-20', 16000, N'Đã thanh toán'),  -- Nguyễn Văn A, 2 lon Coca-Cola
(2, '2025-05-20', 45000, N'Chưa thanh toán'), -- Trần Thị B, 1 chai sữa tắm
(3, '2025-05-20', 81000, N'Đã thanh toán');  -- Lê Văn C, 3 kg xoài (27000 x 3)

CREATE TABLE OrderDetail (
    OrderDetail_Id INT PRIMARY KEY IDENTITY(1,1),
    OrdersID INT, 
    ProductID INT,
    Quantity INT,
    UnitPrice DECIMAL(10,2),
    TotalPrice AS (Quantity * UnitPrice) PERSISTED,
    FOREIGN KEY (OrdersID) REFERENCES Orders(OrdersID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

INSERT INTO OrderDetail (OrdersID, ProductID, Quantity, UnitPrice)
VALUES
(1, 1, 2, 8000),  -- 2 lon Coca-Cola
(2, 4, 1, 45000), -- 1 chai sữa tắm Johnson
(3, 6, 3, 27000); -- 3 kg xoài tứ quý

CREATE TABLE PaymentHistory ( 
    PaymentHistoryID INT PRIMARY KEY IDENTITY(1,1),
    OrdersID INT,
    PaymentDate DATE DEFAULT GETDATE(),
    Amount DECIMAL(10,2),
    TypePayment NVARCHAR(100), -- 'Tiền mặt', 'Thẻ', 'Momo', v.v.
    [Status] NVARCHAR(100), -- 'Đã thanh toán', 'Chờ xử lý'
    FOREIGN KEY (OrdersID) REFERENCES Orders(OrdersID)
);

INSERT INTO PaymentHistory (OrdersID, PaymentDate, Amount, TypePayment, [Status])
VALUES
(1, '2025-05-20', 16000, N'Thẻ', N'Đã thanh toán'),
(3, '2025-05-20', 81000, N'Momo', N'Đã thanh toán');

CREATE TABLE Shipper (
    ShipperID INT PRIMARY KEY IDENTITY(1,1),
    OrdersID INT,
    ShipperName NVARCHAR(100),
    [Status] NVARCHAR(50), -- 'Đang chuẩn bị', 'Đang giao', 'Đã giao'
    FOREIGN KEY (OrdersID) REFERENCES Orders(OrdersID)
);

INSERT INTO Shipper (OrdersID, ShipperName, status)
VALUES
(1, N'Nguyễn Văn A', N'Đã giao'),
(2, N'Trần Thị B', N'Đang giao'),
(3, N'Lê Văn C', N'Đang chuẩn bị');

CREATE TABLE DeliveryTracking (
    DeliveryTrackingID INT PRIMARY KEY IDENTITY(1,1),
    OrdersID INT,
    [Status] NVARCHAR(100),
    UpdatedAt DATETIME DEFAULT GETDATE(),
    [Location] NVARCHAR(255),
    FOREIGN KEY (OrdersID) REFERENCES Orders(OrdersID)
);

INSERT INTO DeliveryTracking (OrdersID, [Status], UpdatedAt, [Location])
VALUES
(1, N'Đã giao', '2025-05-20 22:00:00', N'123 Lê Lợi, Q.1, TP.HCM'),
(2, N'Đang giao', '2025-05-20 22:30:00', N'Đang trên đường'),
(3, N'Đang chuẩn bị', '2025-05-20 22:45:00', N'Kho EcoMart');

-- Kho
CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY IDENTITY(1,1),
    ProductID INT NOT NULL,
    Quantity INT CHECK (Quantity >= 0),
    LastUpdated DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

INSERT INTO Inventory (ProductID, Quantity)
VALUES 
    (1, 120),
    (2, 80),
    (3, 200),
    (4, 50),
    (5, 150);

CREATE TABLE Voucher (
    VoucherID INT PRIMARY KEY IDENTITY(1,1),
    Code VARCHAR(50) UNIQUE,
    OrdersID INT NULL, -- NULL nếu dùng chung
    DiscountAmount DECIMAL(10,2),
    [StartDate] DATE,
    [EndDate] DATE,
    FOREIGN KEY (OrdersID) REFERENCES Orders(OrdersID)
);
select * from Voucher

INSERT INTO Voucher (Code, OrdersID, DiscountAmount, [StartDate], [EndDate])
VALUES
('DISCOUNT10', 1, 1000, '2025-05-01', '2025-05-31'), -- Giảm 1000 cho Coca-Cola
('FRUIT20', NULL, 5000, '2025-05-10', '2025-05-25'), -- Giảm 5000 cho tất cả trái cây
('BEAUTY15', 2, 15000, '2025-05-15', '2025-05-30');  -- Giảm 15000 cho Son Maybelline

CREATE TABLE VoucherUsage (
    VoucherUsageID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT,
    VoucherID INT,
    UseAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (VoucherID) REFERENCES Voucher(VoucherID)
);

INSERT INTO VoucherUsage (CustomerID, VoucherID, UseAt)
VALUES
(1, 4, '2025-05-20 14:30:00'), -- Nguyễn Văn A dùng DISCOUNT10
(2, 5, '2025-05-20 15:45:00'); -- Trần Thị B dùng FRUIT20

-- Bảng Promotions
CREATE TABLE Promotions (
    PromotionID INT PRIMARY KEY IDENTITY(1,1),
    PromotionName NVARCHAR(100) NOT NULL,
    [Description] NVARCHAR(255),
    DiscountPercent DECIMAL(5,2) CHECK (DiscountPercent >= 0 AND DiscountPercent <= 100),
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    IsActive BIT DEFAULT 1, --1 = đang hoạt động, 0 = ngừng
    CHECK (StartDate <= EndDate)
);


-- Insert dữ liệu mẫu cho bảng Promotions
INSERT INTO Promotions (PromotionName, Description, StartDate, EndDate, DiscountPercent, IsActive)
VALUES 
('Khuyến mãi mùa hè', 'Giảm giá 20% cho tất cả sản phẩm mùa hè', '2025-06-01', '2025-08-31', 20, 1),
('Flash Sale cuối tuần', 'Giảm 30% cho sản phẩm chọn lọc', '2025-05-24', '2025-05-26', 30, 1),
('Giảm giá dịp lễ', 'Ưu đãi đặc biệt 15% cho toàn bộ cửa hàng', '2025-12-20', '2025-12-31', 15, 1);

-- Bảng trung gian Promotion_Product (liên kết N-N giữa Promotions và Product)
CREATE TABLE Promotion_Product (
	PromotionProduct_Id INT PRIMARY KEY IDENTITY(1,1),
    PromotionID INT,
    ProductID INT,
    FOREIGN KEY (PromotionID) REFERENCES Promotions(PromotionID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);


-- Giả sử bạn có Product_Id 1, 2, 3 trong bảng Product
-- Gán các sản phẩm này vào các khuyến mãi
INSERT INTO Promotion_Product (PromotionID, ProductID) VALUES
(1, 1),
(1, 2),
(2, 2),
(2, 3),
(3, 1),
(3, 3);

SELECT * FROM Account;
SELECT * FROM Customer;
SELECT * FROM Staff;
SELECT * FROM Token_Table;
SELECT * FROM Review;
SELECT * FROM Cart;
SELECT * FROM Orders;
SELECT * FROM OrderDetail;
SELECT * FROM PaymentHistory;
SELECT * FROM Shipper;
SELECT * FROM DeliveryTracking;
SELECT * FROM Voucher;
SELECT * FROM VoucherUsage;
SELECT * FROM Inventory;
SELECT * FROM Promotions;
SELECT * FROM Promotion_Product;