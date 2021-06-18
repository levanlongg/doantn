-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 18, 2021 at 08:56 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbgomsubattrang`
--

-- --------------------------------------------------------

--
-- Table structure for table `bill_import`
--

CREATE TABLE `bill_import` (
  `id` int(10) UNSIGNED NOT NULL,
  `create_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `producer_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bill_import_detail`
--

CREATE TABLE `bill_import_detail` (
  `id` int(10) UNSIGNED NOT NULL,
  `bill_import_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `shipment_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `acount` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_on_home` int(11) NOT NULL,
  `show_on_admin` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `create_by`, `description`, `show_on_home`, `show_on_admin`, `created_at`, `updated_at`) VALUES
(16, 'Quảng Đông', 'AAAA', 'SSSSSSS', 0, 1, '2021-05-15 01:46:24', '2021-05-17 07:49:06'),
(17, 'Quảng Tây', 'AAAA', 'ÁDDĐ', 0, 1, '2021-05-15 02:11:47', '2021-05-15 02:11:47');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(10) UNSIGNED NOT NULL,
  `subject` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message1` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `subject`, `message`, `email`, `message1`, `create_by`, `created_at`, `updated_at`) VALUES
(19, 'Chất lượng sản phẩm', 'Sản phẩm đa dạng, nhiều mẫu mã đẹp, chất lượng tốt.', 'leviethung@gmail.com', 'Nên sản xuất thêm sản phẩm có nhiều kích cỡ, mẫu mã, màu sắc đa dạng hơn', 'Lê Văn Long', '2021-06-07 04:20:26', '2021-06-07 04:20:26');

-- --------------------------------------------------------

--
-- Table structure for table `introduction`
--

CREATE TABLE `introduction` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` varchar(3000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `introduction`
--

INSERT INTO `introduction` (`id`, `name`, `image`, `content`, `create_by`, `created_at`, `updated_at`) VALUES
(37, 'Cửa hàng Gốm sứ Bát Tràng Hoàng Phát', 'amchentusadangtrong.jpg', 'Hoàng Phát Bát Tràng là cơ sở sản xuất gốm sứ có thâm niên tại làng Bát Tràng, cơ sở là 1 trong những người đầu tiên mang công nghệ lò gas để sản xuất ra các sản phẩm gốm sứ thân thiện với môi trường.\nTừ những năm 90, Hoàng Phát Bát Tràng với tiền thân là cơ sở sản xuất Hưng Anh Bát Tràng đã luôn chú trọng tới  tiếng nói của người tiêu dùng, luôn mang lại những sản phẩm tốt nhất, dịch vụ hoàn hảo nhất tới những người tiêu dùng đáng quý. Với sự am hiểu công nghệ và đam mê gốm sứ, ông Nguyễn Ngọc Anh - chủ cơ sở Hưng Anh Bát Tràng luôn là người tiên phong sử dụng những công nghệ mới để cải tiến quy trình sản xuất sao cho sản phẩm gốm sứ thân thiện với môi trường, sản xuất ra các sản phẩm giá rẻ nhưng luôn đảm bảo chất lượng và phù hợp với thị hiếu người tiêu dùng.\nHoàng Phát Bát Tràng với tôn chỉ đó đã phát huy và kế thừa những tinh hoa đó cộng với sự am hiểu công nghệ đã mang các sản phẩm gốm sứ Bát Tràng tới với nhiều người tiêu dùng hơn thông qua Internet. Chúng tôi thấu hiểu việc cần tham khảo các sản phẩm trước khi chọn mua là một điều vô cùng quan trọng, cho nên trang web của Hoàng Phát Bát Tràng ra đời. Chúng tôi mong muốn khách hàng được quyền biết đầy đủ các thông tin khi quyết định chọn mua bất cứ điều gì. Khách hàng luôn là thượng đế.\nKhách hàng của chúng tôi hiện nay là các nhà bán buôn, bán lẻ khắp cả nước. Họ là:\nCác quán cafe, quán trà: sử dụng các sản phẩm cốc chén trà in logo nhận diện thương hiệu của chính họ. Các quán ăn, nhà hàng: sử dụng các bộ đồ ăn trắng, men màu. Đặc biệt là các nhà hàng Nhật Bản luôn thích sử dụng các loại men màu đen, đỏ, da lươn. Các nhà hàng, khách sạn. Các công ty quà tặng: sử dụng các sản phẩm như cốc, ấm chén, lọ ho in logo hội nghị khách hàng, cung cấp bộ đồ ăn cho nhà hàng. Làm quà tặng cho nhân viên nhân các ngày kỷ niệm. Các cơ quan như: hội đồng nhân dân, ủy ban nhân dân, các hội đồng hương, đồng ngũ. Các nhóm sinh viên có ý tưởng in logo lên cốc để làm đồ trang trí và kinh doanh. Các tiểu thương buôn bán gốm sứ tại Hàn Quốc: sử dụng các đồ ấm chén mini làm đồ chơi cho trẻ em. Chúng tôi mong muốn trở thành đối tác sản xuất hàng gốm với tất cả các cá nhân, tổ chức, doanh nghiệp.', 'Lê Văn Long', '2021-06-07 03:35:19', '2021-06-07 03:35:59');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(2, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(3, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(4, '2016_06_01_000004_create_oauth_clients_table', 1),
(5, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(6, '2021_04_03_040933_create_rolemaster_table', 1),
(7, '2021_04_03_043151_create_users_table', 1),
(8, '2021_04_03_045648_create_contact_table', 1),
(9, '2021_04_03_045742_create_introduction_table', 1),
(10, '2021_04_03_045903_create_services_table', 1),
(11, '2021_04_03_051254_create_category_table', 1),
(12, '2021_04_03_053317_create_product_type_table', 1),
(13, '2021_04_03_053429_create_producer_table', 1),
(14, '2021_04_03_054001_create_product_table', 1),
(15, '2021_04_03_055841_create_prices_table', 1),
(16, '2021_04_03_063048_create_bill_import_table', 1),
(17, '2021_04_03_063122_create_bill_import_detail_table', 1),
(18, '2021_04_03_085604_create_new_type_table', 1),
(19, '2021_04_03_090303_create_new_table', 1),
(20, '2021_04_03_102926_create_customer_table', 1),
(21, '2021_04_03_103002_create_order_table', 1),
(22, '2021_04_03_103017_create_order_detail_table', 1),
(23, '2021_04_07_110825_create_slide_table', 1),
(24, '2021_04_20_183349_create_producers_table', 1),
(25, '2021_04_30_161647_create_session_users_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(10) UNSIGNED NOT NULL,
  `new_type_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` varchar(3000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `new_type_id`, `title`, `description`, `content`, `created_at`, `updated_at`, `image`) VALUES
(8, 78, 'BỘ ĐỒ ĂN HOA VĂN TAM THÁI ĐƯỢC NHÀ HÀNG VIETSTREET ĐẶT HÀNG ĐÃ ĐƯỢC LÊN KENH14.VN', 'Bộ đồ ăn hoa văn Tam Thái được nhà hàng Vietstreet đặt hàng đã được lên kenh14.vn Bộ đồ ăn với vẻ mộc mạc dân giã luôn là lựa chọn phù hợp cho các nhà hàng phong cách quán quê mà Vietstreet là một trong số đó. Mời mọi người chiêm ngưỡng những món ăn cực hấp dẫn được trưng bày trên bộ đồ ăn của gốm sứ Hoàng Phát nhé ạ.', 'Bộ đồ ăn hoa văn Tam Thái được nhà hàng Vietstreet đặt hàng đã được lên kenh14.vn\nBộ đồ ăn với vẻ mộc mạc dân giã luôn là lựa chọn phù hợp cho các nhà hàng phong cách quán quê mà Vietstreet là một trong số đó. Mời mọi người chiêm ngưỡng những món ăn cực hấp dẫn được trưng bày trên bộ đồ ăn của gốm sứ Hoàng Phát nhé ạ.', '2021-06-06 20:38:16', '2021-06-06 20:38:16', 'bo-do-an-hoa-tam-thai.jpg'),
(9, 78, 'HOA VĂN TAM THÁI, HOA VĂN CỦA DĨ VÃNG.', 'Hoa văn Tam thái, hoa văn của dĩ vãng. Hoa văn trông có vẻ tầm thường nhưng chính nó lại là mốt của 1 thời làng Bát Tràng . Người người Tam Thái , nhà nhà Tam Thái, đâu đâu cũng thấy người ta vẽ hoa văn Tam Thái . Bản thân tôi cũng không hiểu cái tên có ý nghĩa như thế nào nhưng thật lòng mà nói thì hoa văn này tôi có cảm giác rất vintage , những nhà hàng, quán ăn theo hơi hướng hoài cổ thưởng sử dụng. Hoa văn Tam Thái...', 'Hoa văn Tam thái, hoa văn của dĩ vãng.\nHoa văn trông có vẻ tầm thường nhưng chính nó lại là mốt của 1 thời làng Bát Tràng. Người người Tam Thái, nhà nhà Tam Thái, đâu đâu cũng thấy người ta vẽ hoa văn Tam Thái.\nBản thân tôi cũng không hiểu cái tên có ý nghĩa như thế nào nhưng thật lòng mà nói thì hoa văn này tôi có cảm giác rất vintage, những nhà hàng, quán ăn theo hơi hướng hoài cổ thưởng sử dụng.\nSau khi viết những dòng trên thì tôi tìm hiểu xem từ Tam Thái có nghĩa ra sao nhưng không có nhiều thông tin lắm nhưng cũng có chút đầu mối. \nĐó là vào những năm 90s của thế kỷ trước, dòng hoa văn này đi theo những nhà buôn Nhật Bản sang Việt Nam cùng với nhu cầu hợp tác làm ăn.\nĐặc điểm của hoa văn này là sự kết hợp 4 màu: đỏ, xanh dương đậm, xanh lá và vàng trên nền chất men rạn nổi tiếng của Bát Tràng. \nVậy nên mới nói thời gian những năm 90s hoa văn này có thể nói là #ĐỘC_BÁ_THIÊN_HẠ, xưởng nào cũng làm, xưởng nào cũng có. Nhưng cũng mode của thời trang, tới nhanh, đi nhanh, các nhà buôn Nhật Bản không còn đặt hàng nữa, hoa văn này cũng không còn được sản xuất nhiều nữa và dần dà cũng bị các hoa văn sặc sỡ hơn lấn át.\nLâu lâu mới thấy đơn hàng và nó cũng là lý do tại sao những chiếc bát, chiếc đĩa có hoa văn Tam Thái này lại được xuất hiện trên video.\nMời các bạn 1 lần ngắm những hoa văn đã từng có thời hoàng kim này.', '2021-06-07 00:33:55', '2021-06-07 00:33:55', 'hoa-van-tam-thai.jpg'),
(10, 78, 'Miệt mài với bàn tiện', 'Hình ảnh trên là hình ảnh anh thợ tiện của Hoàng Phát, anh là người rất có kỹ năng là người có thể đảm nhiệm được rất nhiều công việc. Có thể nói là người đa di năng nhất xưởng, từ việc nặng tới việc nhẹ, từ việc cần kỹ thuật cao tới việc chẳng cần kỹ thuật gì a cũng có thể giúp đỡ mọi người trong xưởng. Làm với xưởng đã lâu tuy nhiên tới giờ mới có bức ảnh đẹp tới vậy, thật là thiếu xót của xưởng', 'Hình ảnh trên là hình ảnh anh thợ tiện của Hoàng Phát, anh là người rất có kỹ năng là người có thể đảm nhiệm được rất nhiều công việc. Có thể nói là người đa di năng nhất xưởng, từ việc nặng tới việc nhẹ, từ việc cần kỹ thuật cao tới việc chẳng cần kỹ thuật gì a cũng có thể giúp đỡ mọi người trong xưởng.\nLàm với xưởng đã lâu tuy nhiên tới giờ mới có bức ảnh đẹp tới vậy, thật là thiếu xót của xưởng.\nDông dài: Tiện là quá trình loại bỏ các thành phần thừa của form sản phẩm ở khâu tạo form. Khi đổ rót thì thành phẩm tạo ra sẽ có những phần thừa, không cần thiết thì tới khâu tiện, người thợ sẽ loại bỏ các phần thừa đó. Công cụ chính của khâu này là bàn xoay và dao tiện hay còn gọi là \"Mây tiện\".\nTiện thường là khâu ngay sau khi đổ rót xong, lúc đó thành phẩm còn hơi ướt hoặc \'ương ương\', lúc này là thời gian tốt nhất để tiện. Người thợ với tay nghề cao sẽ thẩm định thành phẩm để tiện, nếu ẩm quá thì khi tiện sẽ méo mó sản phẩm, nếu cứng và khô quá thì sẽ tiện lâu và không đẹp sản phẩm. Tính chất nghề thủ công nên rất cần kỹ nghệ của người thợ để thẩm định, không thể qua máy móc nào đảm nhiệm được.', '2021-06-07 00:40:39', '2021-06-07 00:40:39', 'tho-tien-hoang-phat-bat-trang.jpg'),
(11, 78, 'MỘT ĐỊA ĐIỂM ĐI PHƯỢT THÚ VỊ CHO CÁC BẠN - LÀNG GỐM CỔ TRUYỀN BÁT TRÀNG', 'Nếu điều kiện tài chính không cho phép bạn có một kì nghỉ xa dài ngày thì một chuyến đổi gió ra ngoại thành Hà Nội để xả hơi cũng là một lựa chọn không tồi. Du lịch Bát Tràng và khám phá làng gốm chính là một trong những điểm đến thú vị điển hình mà bạn không nên bỏ lỡ. 1. Những địa điểm chụp ảnh thú vị Một trong những thú vị đầu tiên khi tới Bát Tràng chính là đường tới ngôi làng cổ này. Xuôi qua cầu Chương Dương, đi qua con đê dài, đây là những điểm bạn có thể dừng lại...', 'Nếu điều kiện tài chính không cho phép bạn có một kì nghỉ xa dài ngày thì một chuyến đổi gió ra ngoại thành Hà Nội để xả hơi cũng là một lựa chọn không tồi. Du lịch Bát Tràng và khám phá làng gốm chính là một trong những điểm đến thú vị điển hình mà bạn không nên bỏ lỡ.\n1. Những địa điểm chụp ảnh thú vị\nMột trong những thú vị đầu tiên khi tới Bát Tràng chính là đường tới ngôi làng cổ này. Xuôi qua cầu Chương Dương, đi qua con đê dài, đây là những điểm bạn có thể dừng lại để cùng bạn bè ghi lại những bức ảnh đẹp trong chuyến dã ngoại \"hạt dẻ\".\nNếu muốn chuyến đi chơi của mình khác lạ, bạn nên bắt đầu bằng việc đi dạo một vòng quanh làng. Quanh những con ngõ nhỏ chạy quanh làng là nhiều xưởng gốm tư nhân hay những giàn phơi gốm mini rất thú vị.\nLàng Bát Tràng nằm bên tả ngạn sông Hồng. Nếu đã đến đây, bạn cũng có thể đi bộ ra ven sông, ngắm những cảnh đẹp và tận hưởng không khí thoáng đãng của sông. Đặc biệt, gần bến sông còn có xe trâu, bạn có thể thử đi và trải nghiệm cảm giác khám phá Bát Tràng trên những bước đi chậm rãi mà chắc chắn của những chú trâu.\n2. Sân chơi gốm\nSau khi đã dạo chơi và chụp ảnh, bạn có thể thử cảm giác làm thợ gốm với mức phí rất rẻ, chỉ 10.000 đồng một người. Các chủ sân chơi thường luôn túc trực ở cổng chợ đón khách. Vào sân chơi, bạn sẽ được chơi với bàn gốm xoay. Đừng lo nếu bạn không biết cách sử dụng chúng, các anh thợ ở đây sẽ hướng dẫn tận tình, giúp tạo hình, lấy tâm mẫu cho bạn. Còn bạn thì tha hồ sáng tạo và thử sức với đất sét.\n3. Chợ Bát Tràng\nChợ gốm là nơi bạn không nên bỏ qua khi du lịch Bát Tràng. Chợ rộng khoảng 6.000 mét vuông, chia thành các gian hàng nhỏ bày bán đủ loại mặt hàng thủ công mỹ nghệ liên quan đến gốm sứ, từ những gian hàng bát đĩa cao cấp, đồ trang trí mĩ nghệ đẹp mắt cho đến mặt hàng đồ thờ cúng, tiểu cảnh non bộ cho đến những món đồ lưu niệm, cốc chén và các món bát đĩa bình dân.', '2021-06-07 00:44:48', '2021-06-07 00:44:48', 'gom-co-truyen-bat-trang.jpg'),
(12, 78, 'Tại sao lên chọn Gốm Sứ Hoàng Phát làm đối tác?', 'Công ty TNHH Gốm Sứ Hoàng Phát Bát Tràng với tiền thân là một hộ sản xuất kinh doanh cá thể tại làng nghề Bát Tràng xuất phát điểm ban đầu là một xưởng nhỏ, nhân công ít ỏi nhưng với niềm đam mê gốm sứ, khát vọng sáng tạo, gốm sứ Hoàng Phát ngày càng phát triển và hiện tại đã là đối tác của rất nhiều công ty quà tặng khắp 3 miền Bắc, Trung, Nam, uy tín ngày càng được khẳng định rõ rệt. In ấn logo Đại Hội XI Năm...', 'Công ty TNHH Gốm Sứ Hoàng Phát Bát Tràng với tiền thân là một hộ sản xuất kinh doanh cá thể tại làng nghề Bát Tràng xuất phát điểm ban đầu là một xưởng nhỏ, nhân công ít ỏi nhưng với niềm đam mê gốm sứ, khát vọng sáng tạo, gốm sứ Hoàng Phát ngày càng phát triển và hiện tại đã là đối tác của rất nhiều công ty quà tặng khắp 3 miền Bắc, Trung, Nam, uy tín ngày càng được khẳng định rõ rệt.\n      Năm 2016, Gốm Sứ Hoàng Phát đã sở hữu trên 1000m2 mặt sàn để phục vụ sản xuất với thiết kế khoa học, tối ưu hóa diện tích sản xuất. Các phân khu sản xuất được sắp xếp gọn gàng, chặt chẽ cho quy trình sản xuất hàng hóa liên hoàn, đảm bảo năng suất sản xuất đạt hiệu quả tốt nhất \n      Điều khiến Gốm Sứ Hoàng Phát ngày càng phát triển đó là đội ngũ công nhân viên cực yêu nghề, trình độ cao, có thâm niên hơn 15 năm sản xuất gốm sứ, đó chính là động lực lớn nhất khiến gốm sứ Hoàng Phát vững mạnh, phát triển đến ngày hôm nay. Với tâm niệm \'\' Mỗi gia đình Việt đều có ít nhất 1 món đồ gốm sứ của Hoàng Phát \", chúng tôi luôn nỗ lực và tìm tòi sáng tạo bằng niềm đam mê, tri thức để đặt được mục tiêu, mang sản phẩm Bát Tràng, sản phẩm Việt tới người tiêu dùng Việt Nam và xa hơn thị trường nước ngoài.\n       Với kinh nghiệm sản xuất và phân phối sản phẩm gốm sứ hơn 20 năm, đã giao hàng trên 40 tỉnh thành trong cả nước, là đối tác của nhiều công ty vận chuyển lớn nhỏ, Gốm Sứ Hoàng Phát tin tưởng vào việc vận chuyển hàng hóa tới mọi miền Việt Nam với chi phí tiết kiệm nhất, hiệu quả cao nhất với thời gian ngắn nhất.', '2021-06-07 00:49:19', '2021-06-07 00:49:19', 'gom-lam-doi-tac.jpg'),
(13, 78, 'LỌ HOA PHONG CÁCH CỔ ĐIỂN CHÂU ÂU - MANG KHÔNG GIAN ĐẸP CHO NHÀ BẠN!', 'Lọ hoa phong cách cổ điển Châu Âu là một vật phẩm trang trí khá sang trọng, làm cho không gian nhà bạn đẹp lộng lẫy, và đây là món quà ấn tượng dành tặng cho ngườ thân, khách hàng và đối tác vào những ngày kỷ niệm . Lọ hoa phong cách cổ điển Châu Âu Thuyền cải Lọ hoa Composite cao cấp có thể để trên bàn làm việc ở văn phòng, làm duyên cho tủ sách, phòng ngủ, hay phòng khách… tạo thêm sự bắt mắt, tinh tế. Không đơn thuần dùng...', 'Lọ hoa phong cách cổ điển Châu Âu là một vật phẩm trang trí khá sang trọng, làm cho không gian nhà bạn đẹp lộng lẫy, và đây là món quà ấn tượng dành tặng cho người thân, khách hàng và đối tác vào những ngày kỷ niệm.\nLọ hoa Composite cao cấp có thể để trên bàn làm việc ở văn phòng, làm duyên cho tủ sách, phòng ngủ, hay phòng khách… tạo thêm sự bắt mắt, tinh tế. Không đơn thuần dùng để cắm hoa, đôi khi bình đứng “một mình” cũng tạo nên vẻ đẹp và phong cách riêng, giúp căn phòng thêm sang trọng và lộng lẫy.\nMang “thiên nhiên” tới căn nhà của mình bằng việc trang trí những lọ hoa composite, bông hoa xinh xắn sẽ làm cho không gian sống trở nên hài hòa, có tác động ý nghĩa tới tinh thần và sức khỏe của bạn.', '2021-06-07 00:51:41', '2021-06-07 00:51:41', 'lo-hoa-phong-cach-co-dien.jpg'),
(14, 78, 'CÁCH PHÂN BIỆT GỐM SỨ BÁT TRÀNG VÀ GỐM SỨ TRUNG QUỐC', 'Gốm sứ Bát Tràng là một dòng gốm Việt Nam có lịch sử gắn liền với việc hình thành làng gốm cổ Bát Tràng từ thế kỷ XIV – XV. Làng gốm sứ Bát Tràng với lịch sử hình thành hơn 700 năm nay, làng gốm sứ Bát Tràng vẫn đang tồn tại và phát triển một cách rực rỡ. Cho đến nay sản phẩm gốm sứ Bát Tràng ngày càng phong phú và đa dạng. Ngoài những mặt hàng truyền thống, Bát Tràng còn sản xuất nhiều mặt hàng mới đáp ứng nhu cầu trong nước cũng như quốc tế. Cùng...', 'Gốm sứ Bát Tràng là một dòng gốm Việt Nam có lịch sử gắn liền với việc hình thành làng gốm cổ Bát Tràng từ thế kỷ XIV – XV.\nLàng gốm sứ Bát Tràng với lịch sử hình thành hơn 700 năm nay, làng gốm sứ Bát Tràng vẫn đang tồn tại và phát triển một cách rực rỡ. Cho đến nay sản phẩm gốm sứ Bát Tràng ngày càng phong phú và đa dạng. Ngoài những mặt hàng truyền thống, Bát Tràng còn sản xuất nhiều mặt hàng mới đáp ứng nhu cầu trong nước cũng như quốc tế. Cùng với bàn tay khéo léo của những nghệ nhân tài hoa, các sản phẩm gốm sứ độc đáo ra đời mang trên mình những nét tinh túy riêng của một làng nghề truyền thống.\nTheo sự phát triển của thị trường và sự ảnh hưởng của gốm sứ Trung Quốc nên gốm sứ Bát Tràng cũng có nhiều thay đổi. Bài viết này do chúng tôi tổng hợp được từ kinh nghiệm thực tế sẽ giúp chúng ta có thể dễ dàng nhận ra được, phân biệt được đâu là gốm sứ của làng nghề Truyền thống Bát Tràng, đâu là hàng Trung Quốc.\nVới màu sắc họa tiết của gốm sứ Bát Tràng thường có ít màu, một hoặc hai màu, trông trang nhã không lòe loẹt. Màu sắc thường là các màu đơn gian gần gũi với đời sống hàng ngày như: màu đại thanh, màu xanh non, màu xanh là, màu huyết dụ...\n Với hàng Trung Quốc thì màu sắc có phần lòe loẹt, người sử dụng thường hay bị ấn tượng bởi điều này, các màu thương là đỏ, vàng, hay xanh thẫm,... Chúng ta có thể thấy ở gốm sứ Giang Tây bán ở ngoài đường rất nhiều.\n2. Về độ trong của xương đất:\n     Với gốm sứ Bát Tràng độ trong kém hơn so với gốm sứ Trung Quốc, điều này chúng ta có thể kiểm tra khi đưa sản phẩm ra ngoài sáng, nếu chỉ hơi thấy bàn tay của chúng ta ở phía bên kia sản phẩm thì là của Bát Tràng, còn nếu nhìn rất rõ thì phải xem lại.\n    Tuy nhiên, giờ có một số mặt hàng cao cấp của gốm sứ Bát Tràng cũng có khả năng trong suốt cao mà chất lượng vẫn được giữ nguyên.\n3. Độ dầy của sản phẩm:\nVới gốm sứ Bát Tràng làm thủ công nên thường dầy hơn so với gốm sứ Trung Quốc, khi cầm sản phẩm ta có cảm giác nặng tay, và chắc chắn. Còn với hàng Trung Quốc sẽ mỏng hơn so với hàng của Bát Tràng.', '2021-06-07 00:55:18', '2021-06-07 00:55:18', 'cach-phan-biet-voi-gom-trung-quoc.jpg'),
(15, 79, 'ĐỒ THỜ VẼ VÀNG, BÁT HƯƠNG VẼ VÀNG BÁT TRÀNG, VÀNG 24K CAO CẤP', 'Đồ thờ cúng là món không thể thiếu trong 1 gia đình khi về nhà mới. Ngoài việc xây dựng 1 căn nhà với các công năng, với vẻ thẩm mĩ thì việc tìm đặt một không gia thờ cùng các đồ thờ là vô cùng quan trọng. Việc thờ cúng luôn ăn sâu trong đời sống tâm linh của người Việt Nam. Hiện nay có rất nhiều các bộ đồ thờ, bộ bát hương đẹp với đa dạng màu men như men rạn , men lam , men vàng … thì gốm Hoàng Phát đã phát triển và cho ra thị trường dòng đồ thờ men lam cao cấp vẽ ...', 'Đồ thờ cúng là món không thể thiếu trong 1 gia đình khi về nhà mới. Ngoài việc xây dựng 1 căn nhà với các công năng, với vẻ thẩm mĩ thì việc tìm đặt một không gia thờ cùng các đồ thờ là vô cùng quan trọng. Việc thờ cúng luôn ăn sâu trong đời sống tâm linh của người Việt Nam. Hiện nay có rất nhiều các bộ đồ thờ, bộ bát hương đẹp với đa dạng màu men như men rạn, men lam, men vàng … thì gốm Hoàng Phát đã phát triển và cho ra thị trường dòng đồ thờ men lam cao cấp vẽ vàng thật 24k rất sáng bóng. Bài viết này sẽ cho quý khách biết thêm các thông tin về dòng đồ thờ vẽ vàng với các bát hương vàng 24k.\n1. Bộ đồ thờ vẽ vàng 24k là gì?\nBản chất dòng đồ thờ vẽ vàng 24k là dòng đồ thờ men lam truyền thống nay được vẽ thêm 1 lớp vàng dùng dịch, vàng này còn được là Gold luster\nNhư trên ảnh trên, quý khách có thể thấy được hình ảnh Bát hương chưa được vẽ vàng trông như thế nào. Việc vẽ vàng là một việc rất cẩn thận và tỉ mỉ, cụ thể thì chúng tôi sẽ nói ở phần dưới của bài viết.\n2. Bộ đồ thờ vẽ vàng 24k được làm ra như thế nào\nNhư đã nói ở phần trên thì bộ đồ thờ vẽ vàng có gốc là bộ đồ thờ men lam, đồ thờ men lam thì có loại trơn, loại nổi. Để tạo ra bộ đồ thờ men lam thì xưởng gốm Hoàng Phát đã phải nghiên cứu, tìm tòi để tìm ra cách vẽ vàng để vàng bám lên gốm sứ 1 cách tốt nhất, sáng bóng nhất.\nBan đầu, từ những hòn đất vô tri vô giác qua bàn tay của người thợ thủ công tỷ mẩn, khéo léo đã tạo ra khuôn hình của bộ đồ thờ, sau đó bộ đồ thờ này được người thợ vẽ khéo léo vẽ lên các chi tiết mềm mại, qua lò lửa gần 1300 độ C để tạo ra sản phẩm hoàn thiện. Nhưng để tạo ra được sản phẩm vẽ vàng ưng ý thì thì phần vẽ vàng cũng là phần vô cùng quan trọng, vàng là chất lỏng có giá trị cao cho nên người vẽ cũng phải là người vô cùng cẩn thận, tỷ mỉ, tránh để lãng phí vàng. Sau khi vẽ vàng xong thì sản phẩm phải qua 1 nhiệt độ khoảng 800 độ C nữa để có thể ra sản phẩm hoàn chỉnh.', '2021-06-07 01:03:16', '2021-06-07 01:03:16', 'bo-lu-huong-dinh-hac-ve-vang-24k.png'),
(16, 79, 'GỐM SỨ VẼ VÀNG CAO CẤP - KHI NGHỆ THUẬT LÊN TIẾNG', 'Gốm sứ vẽ vàng cao cấp - Khi nghệ thuật lên tiếng Đồ dùng được làm từ vàng, bạc được coi là món đồ thiết yếu đối với các vị vua chúa, quý tộc ngày xưa để tôn lên sự quyền quý, giàu sang của mình. Cũng như vậy, khi ở ngày nay, những món đồ trên vẫn luôn mang trong mình giá trị rất xa xỉ, thể hiện đẳng cấp cho người sử dụng. Một trong số đó, không thể không nhắc đến Gốm sứ vẽ vàng cao cấp - Mặt hàng gốm sứ bát tràng nổi tiếng với nét sang...', 'Đồ dùng được làm từ vàng, bạc được coi là món đồ thiết yếu đối với các vị vua chúa, quý tộc ngày xưa để tôn lên sự quyền quý, giàu sang của mình. Cũng như vậy, khi ở ngày nay, những món đồ trên vẫn luôn mang trong mình giá trị rất xa xỉ, thể hiện đẳng cấp cho người sử dụng. Một trong số đó, không thể không nhắc đến Gốm sứ vẽ vàng cao cấp - Mặt hàng gốm sứ bát tràng nổi tiếng với nét sang trọng, thời thượng, trường tồn theo năm tháng. \n1. Gốm sứ vẽ vàng cao cấp là gì ?\nTừ lâu, gốm bát tráng vốn là dòng gốm rất nổi tiếng cả trong và ngoài nước bởi chất lượng tuyệt hảo, mẫu mã đa dạng qua bàn tay điêu luyện của các nghệ nhân tài ba từ làng nghề bát tràng truyền thống tại Hà Nội. Không chỉ vậy, trong những năm gần đây, việc cho ra đời những mặt hàng gốm sứ vẽ vàng cao cấp cùng những đường nét, hoa văn độc đáo mang giá trị thẩm mỹ riêng biệt và đậm đà bản sắc dân tộc đã giúp cho cho dòng gốm bát tràng Hà Nội bước lên một tầm cao mới, một nấc thang của nghệ thuật truyền thống. \nGốm sứ vẽ vàng cao cấp là loại gốm sứ được các nghệ nhân khéo léo dùng vàng kim thếp lên gốm sứ thật cẩn thận, tinh tế. Chúng mang một giá trị nghệ thuật to lớn khi kết hợp từ nguyên liệu cao quý là vàng với dòng gốm bát tràng nối tiếng chất lượng, thẩm mỹ. \nĐồ gốm bát tràng sở dĩ rất đắt đỏ bởi công vẽ, dát vàng và chế tác vô cùng tỉ mỉ của nghệ nhân. Thông thường, họ phải mất từ 1 - 2 tháng mới hoàn thành xong một sản phẩm tùy vào độ khó, họa tiết cầu kỳ mà có thể tiêu tốn nhiều hơn. Do vậy, không chỉ những người nhiều tiền, đại gia mới \"săn đón\" gốm sứ vẽ vàng cao cấp , mà ngay cả những người yêu nghệ thuật cũng luôn sẵn sàng xuống tay để sở hữu \"đứa con\" của nghệ thuật gốm bát tràng truyền thống này.', '2021-06-07 01:07:05', '2021-06-07 01:07:05', 'gom-su-ve-vang-cao-cap-12.jpg'),
(17, 79, 'MUA GỐM SỨ VẼ VÀNG Ở ĐÂU UY TÍN NHẤT TẠI HÀ NỘI ?', 'Mua gốm sứ vẽ vàng ở đâu uy tín nhất tại Hà Nội ? Trong những năm gần đây, gốm sứ vẽ vàng đang trở thành một món đồ trang trí nhận được rất nhiều tình cảm của người tiêu dùng bởi tính thẩm mỹ, độc đáo, khác biệt của chúng. Tuy nhiên, ngoài vấn đề giá cả, để có thể \"rước\" được một sản phẩm gốm sứ vẽ vàng Bát Tràng chính hiệu vốn dĩ không phải là chuyện dễ dàng khi trên thị trường hiện nay luôn có rất nhiều hàng nhái, hàng kém chất lượng đội lốt...', 'Trong những năm gần đây, gốm sứ vẽ vàng đang trở thành một món đồ trang trí nhận được rất nhiều tình cảm của người tiêu dùng bởi tính thẩm mỹ, độc đáo, khác biệt của chúng. Tuy nhiên, ngoài vấn đề giá cả, để có thể \"rước\" được một sản phẩm gốm sứ vẽ vàng Bát Tràng chính hiệu vốn dĩ không phải là chuyện dễ dàng khi trên thị trường hiện nay luôn có rất nhiều hàng nhái, hàng kém chất lượng đội lốt những \"đại lý Bát Tràng chính hãng\" gây hoang mang cho khách hàng. Do vậy, đừng bỏ qua bài viết này để có cho bản thân sự lựa chọn đúng đắn nhất nhé. \n1. Gốm sứ vẽ vàng Bát Tràng là gì ?\nĐể biết mua gốm sứ vẽ vàng ở đâu tại Hà Nội, chúng ta hãy cùng tìm hiểu xem gốm sứ vẽ vàng Bát Tràng là gì và chúng có giá trị như thế nào. \nGốm sứ Bát Tràng vốn được coi là một kiệt tác của nghệ thuật truyền thống tại Việt Nam với lịch sử lâu đời cùng những thành tựu to lớn. Việc cho ra đời những dòng sản phẩm gốm sứ vẽ vàng với những đường nét, chi tiết được khắc họa tỉ mỉ, độc đáo bằng vàng đã khiến cho gốm sứ vẽ vàng Bát Tràng bước lên một đẳng cấp mới của nghệ thuật và được sự săn đón của rất nhiều người.\nThực chất, sản phẩm gốm sứ vẽ vàng đã xuất hiện từ thời xa xưa, nhưng lúc đó các cụ chỉ viền vàng lên sản phẩm gốm. Còn ngày nay, với tư duy mới mẻ trong nghệ thuật cùng óc sáng tạo của các nghệ nhân, họ đã biết cách sử dụng vàng kim làm nổi bật rõ những hoa văn cho sản phẩm gốm thêm độc đáo, đặc biệt. \nCác sản phẩm gốm sứ vẽ vàng phổ biến thường là bình hút lộc, lọ dáng tỳ bà,... Mỗi kiệt tác đều được các nghệ nhân trau chuốt cẩn thận và tốn rất nhiều thời gian. Thông thường mỗi sản phẩm gốm sứ vẽ vàng ngốn thời gian của người nghệ nhân tầm 1 - 2 tháng, thậm chí đến 1 năm tùy theo độ phức tạp của các họa tiết. Qua đó, ta có thể thấy được sự \"thần thánh\" cùng khả năng tuyệt vời của các nghệ nhân khi làm nên những kiện tác nghệ thuật này.', '2021-06-07 01:09:46', '2021-06-07 01:09:46', 'mua-gom-su-ve-vang-o-dau-tai-ha-noi.jpg'),
(18, 79, 'GỐM SỨ BÁT TRÀNG VẼ VÀNG 24K - GỐM SỨ CAO CẤP MỚI CỦA BÁT TRÀNG', 'Gốm sứ bát tràng vẽ vàng 24k - gốm sứ cao cấp mới của Bát Tràng NỘI DUNG BÀI VIẾT - Click để xem nhanh Gốm sứ vẽ vàng là gì Quy trình thực hiện Hình ảnh gốm sứ vẽ vàng Tư vấn gốm sứ vẽ vàng ...', 'I. Gốm sứ bát tràng vẽ vàng 24k - gốm sứ cao cấp mới của Bát Tràng\nGốm sứ là vật liệu có từ lâu đời và cũng là một trong ngũ hành tương sinh, tương khắc trong phong thủy. Để làm ra được gốm sứ thì đều phải đầy đủ ngũ hành mới sản sinh ra được, Thổ là đất để làm gốm sứ, đất pha với nước là dùng Thủy, dùng củi để đốt là Mộc, có lửa để đốt gỗ là dùng Hỏa, dùng oxide kim loại để vẽ, trang trí là dùng Kim. Vậy là đủ ngũ hành tương sinh, tương khắc có trong 1 sản phẩm gốm sứ. Hiếm có vật liệu nào có hòa trộn đầy đủ các yếu tố phong thủy vào như vậy.\nGần đây gốm sứ đang ngày càng được nhiều người ưa chuộng và càng được yêu thích hơn khi giờ đây gốm sứ đã được tô điểm lên những nét vàng đầy sự tinh tế và sang trọng đặc biệt trên nền gốm sứ men lam và các dòng đầy màu sắc khác.', '2021-06-07 01:12:26', '2021-06-07 01:12:26', 'binh-tai-loc-ve-vang-24k-tam-phuc.jpg'),
(19, 79, 'GỐM SỨ VẼ VÀNG 24K, MỘT ĐỈNH CAO MỚI CỦA GỐM SỨ', 'Gốm sứ Bát Tràng qua ngàn đời làm ra những sản phẩm phục vự đời sống người dân như ấm chén, bát đĩa, chum vại dưa cà cho tới phục vụ các vị quan lại, vương công quý tộc Việt Nam như các sản phẩm lục bình sứ, tranh gốm sứ, thống gốm sứ và các hàng gốm sứ phong thủy khác. Càng ngày càng có sự tiến bộ, gốm sứ từ những sản phẩm thô mộc trở thành gốm sứ với nhiều nét tinh hoa, sắc sảo. Mà nói tới sự sắc sảo và tinh hoa thì gốm sứ vẽ vàng 24k chính là đỉnh cao của nghệ thuật gốm sứ....', 'I. Gốm sứ vẽ vàng 24k, một đỉnh cao mới của gốm sứ\nGốm sứ Bát Tràng qua ngàn đời làm ra những sản phẩm phục vự đời sống người dân như ấm chén, bát đĩa, chum vại dưa cà cho tới phục vụ các vị quan lại, vương công quý tộc Việt Nam như các sản phẩm lục bình sứ, tranh gốm sứ, thống gốm sứ và các hàng gốm sứ phong thủy khác. Càng ngày càng có sự tiến bộ, gốm sứ từ những sản phẩm thô mộc trở thành gốm sứ với nhiều nét tinh hoa, sắc sảo. Mà nói tới sự sắc sảo và tinh hoa thì gốm sứ vẽ vàng 24k chính là đỉnh cao của nghệ thuật gốm sứ.\nVàng 24k là vàng nguyên chất 99.99% vàng ròng, thứ vàng có giá trị cao nhưng khi được vẽ trên nền gốm sứ còn tăng giá trị lên bội phần. Về chất phôi gốm sứ, phôi được vẽ vàng có thể là bình hút lộc, lục bình củ tỏi, lục bình tỳ bà, bộ ấm chén Bát Tràng. Chất phôi trước khi được mang đi vẽ vàng đều đã được tuyển chọn kỹ lưỡng cẩn thận vì sau khi vẽ vàng mà phát hiện ra lỗi thì quả thật là rất phí 1 sản phẩm vàng cao cấp.\nII. Sản phẩm gốm sứ vẽ vàng 24k\nPhải nói các sản phẩm gốm sứ men lem, khi khoác thêm màu áo vàng 24k thì trở nên sáng bóng hơn bao giờ hết, sản phẩm bỗng trở nên sang trọng lạ thường, trở thành món quà cực đẳng cấp cho đối tác, bạn bè, người thân.', '2021-06-07 01:16:19', '2021-06-07 01:16:19', 'binh-tai-loc-cong-dao-ve-vang-24k-custom.jpg'),
(20, 79, 'BÌNH HÚT LỘC VẼ VÀNG CAO CẤP GIÁ TỪ 3 TRIỆU', 'BÌNH HÚT LỘC VẼ VÀNG CAO CẤP GIÁ TỪ 3 TRIỆU Bình hút lộc được làm chủ yếu từ đất sét trắng, được tinh luyện và nhào nặn kỹ lưỡng. Ngoài ra, bình còn có thể được làm từ chất liệu gốm sứ, pha lê bằng đất hoặc bằng kim loại như đồng, bạc, vàng. Bình hút lộc làm bằng gốm sứ hoặc pha lê thuộc hành Thổ còn bình thuộc hành Kim phải làm bằng đồng bạc hoặc vàng. Nếu có thể bạn nên dùng bình mạ vàng sẽ đem lại hiệu quả tốt nhất. Đặc biệt bình hút lộc có thể...', 'I. BÌNH HÚT LỘC VẼ VÀNG CAO CẤP GIÁ TỪ 3 TRIỆU\nBình hút lộc được làm chủ yếu từ đất sét trắng, được tinh luyện và nhào nặn kỹ lưỡng. Ngoài ra, bình còn có thể được làm từ chất liệu gốm sứ, pha lê bằng đất hoặc bằng kim loại như đồng, bạc, vàng. Bình hút lộc làm bằng gốm sứ hoặc pha lê thuộc hành Thổ còn bình thuộc hành Kim phải làm bằng đồng bạc hoặc vàng. Nếu có thể bạn nên dùng bình mạ vàng sẽ đem lại hiệu quả tốt nhất. Đặc biệt bình hút lộc có thể vẽ thêm vàng hoặc dát vàng vào những họa tiết trên bình sẽ toát lên vẻ sang trọng, tinh tế.\nMỗi sản phẩm là một bức tranh sống động về thiên nhiên, con người, con vật,…nhưng chúng đều hàm chứa một ý nghĩa phong thủy riêng biệt, có thể là may mắn, hòa thuận, sum vầy,…\nBình hút lộc bát mã truy phong vẽ vàng mang nhiều ý nghĩa về thành công trong kinh doanh, thắng lợi trong chiến trận với hình ảnh mã đáo – ngựa quay về, tám chú ngựa đang phi nước đại tiến về một hướng - số 8 biểu trưng cho sự may mắn, phát đạt.\nBình hút Tài lộc Phúc mãn đường vẽ vàng có ý nghĩa đem hạnh phúc, may mắn, bình an cho gia chủ, đây còn là sản phẩm phong thủy thu hút tài lộc, tiền tài khi đặt đúng vị trí trong nhà bạn. Họa tiết trên bình được vẽ bằng tay, đường nét được đánh thêm một lớp chỉ vàng kim óng ánh.\nBình hút tài lộc sen hạc vẽ vàng mang đến may mắn và tài lộc cho ngôi nhà của mình, là một món quà vô cùng ý nghĩa mà bạn dành tặng cho bạn bè, người thân của mình. Chim hạc và hoa sen đều là đại diện cho những biểu tượng cao quý với ý nghĩa hết sức cao đẹp.\nBình hút lộc đắp nổi Rồng vẽ vàng là biểu tượng tích cực và sáng tạo, là sức mạnh của sự sống, là biểu tượng cho sự tốt đẹp, may mắn và thịnh vượng, có ý nghĩa tượng trưng cho những gì cao quý tốt đẹp nhất trong đời sống con người. ... Rồng là hình tượng của mưa thuận gió hòa, là vật linh đứng vào hàng bậc nhất trong tứ linh \"long, lân, quy, phụng. Bình hút lộc đắp rồng vẽ vàng gồm màu xanh saphia, đỏ, vàng, xanh lá cây. Mỗi mệnh hợp với từng màu khác nhau', '2021-06-07 01:18:55', '2021-06-07 01:18:55', 'binh-hut-loc-ca-chep-vang-kim.jpg'),
(21, 79, 'VẼ VÀNG LÊN GỐM SỨ - HÌNH ẢNH XƯỞNG ĐẸP CỦA VÀNG VÀ NHỮNG NGƯỜI THỢ', 'Vẽ vàng lên gốm sứ - hình ảnh xưởng đẹp của vàng và những người thợ Để có 1 sản phẩm gốm sứ vẽ vàng thành công thì phải trải qua rất nhiều thời gian và sử dụng rất nhiệt kinh nghiệm để sản phẩm có thể đạt được độ đẹp, độ hoàn hảo cao nhất. Vẽ vàng lên gốm sứ có trường phái để thực hiện đó là: vẽ vàng lên phôi đơn sắc và vẽ vàng lên phôi đa sắc - họa tiết . Vẽ vàng lên phôi đơn sắc là vẽ...', 'I. Vẽ vàng lên gốm sứ - hình ảnh xưởng đẹp của vàng và những người thợ\nĐể có 1 sản phẩm gốm sứ vẽ vàng thành công thì phải trải qua rất nhiều thời gian và sử dụng rất nhiệt kinh nghiệm để sản phẩm có thể đạt được độ đẹp, độ hoàn hảo cao nhất.\nVẽ vàng lên gốm sứ có trường phái để thực hiện đó là: vẽ vàng lên phôi đơn sắc và vẽ vàng lên phôi đa sắc - họa tiết. Vẽ vàng lên phôi đơn sắc là vẽ cách thức vẽ vàng lên phôi trắng (chủ yếu) hoặc là phôi đơn sắc màu khác, cách thức vẽ này là cách thức khó hơn vẽ vàng lên phôi đa sắc - họa tiết bởi vì những nét vẽ phải rất tỉ mỉ, cẩn thận và các thức sử dụng vàng cũng cần tiết kiệm nhưng vẫn phải tạo được độ thẩm mĩ cao cho sản phẩm.\nVẽ vàng lên phôi đa sắc - họa tiết hay còn gọi là Đồ vàng là hình thức sử dụng những sản phẩm đã được vẽ hoàn thiện rồi và vẽ thêm vàng vào những phần cần sự nổi bật trong họa tiết, làm cho sản phẩm có độ sang trọng, bóng bẩy. So hai phương pháp thì vẽ trên phôi đơn sắc cầu kỳ hơn và khó hơn, cũng tốn vàng kim hơn loại vẽ vàng trên phôi đa sắc, họa tiết.', '2021-06-07 01:30:13', '2021-06-07 01:30:13', 've-vang-len-gom-su-07.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `new_type`
--

CREATE TABLE `new_type` (
  `id` int(10) UNSIGNED NOT NULL,
  `new_type_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `new_type`
--

INSERT INTO `new_type` (`id`, `new_type_name`, `description`, `created_at`, `updated_at`) VALUES
(78, 'Blog', 'Blog chia sẻ kiến thức về gốm', '2021-06-06 11:41:15', '2021-06-06 11:41:15'),
(79, 'Gốm vẽ vàng', 'Kiến thức về gốm vẽ vàng', '2021-06-06 11:43:53', '2021-06-06 11:43:53'),
(80, 'Tranh gốm', 'Kiến thức tranh gốm', '2021-06-06 11:44:40', '2021-06-06 11:44:40'),
(81, 'Lục bình', 'Kiến thức về lục bình', '2021-06-06 11:45:16', '2021-06-06 11:45:16'),
(82, 'Tượng phong thủy', 'Kiến thức về tượng phong thủy', '2021-06-06 11:49:31', '2021-06-06 11:49:31');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_phone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_note` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `totalMoney` int(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `payment_status` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `order_name`, `order_address`, `order_email`, `order_phone`, `order_note`, `totalMoney`, `created_at`, `updated_at`, `payment_status`) VALUES
(60, 'Lê Văn Long', 'Quang Hưng - Phù Cừ - Hưng Yên', 'levanlong@gmail.com', '0984079341', 'Giao hàng nhanh', 85000, '2021-06-06 04:35:19', '2021-06-06 04:35:19', 3),
(63, 'Lê Văn Long', 'Quang Hưng - Phù Cừ - Hưng Yên', 'levanlong@gmail.com', '0984079341', 'Giao hàng nhanh', 1375000, '2021-06-08 02:44:17', '2021-06-08 02:44:17', 1),
(64, 'Lê Việt Hưng', 'Quang Hưng - Phù Cừ - Hưng Yên', 'leviethung@gmail.com', '0984079341', 'Giao hàng nhanh', 2800000, '2021-06-08 03:13:40', '2021-06-08 03:13:40', 3),
(65, 'Lê Văn Long', 'Quang Hưng - Phù Cừ - Hưng Yên', 'levanlong@gmail.com', '0984079341', 'Giao hàng nhanh', 2820000, '2021-06-09 01:39:08', '2021-06-09 01:39:08', 2),
(66, 'Lê Văn Long', 'Quang Hưng - Phù Cừ - Hưng Yên', 'levanlong@gmail.com', '0984079341', 'Giao hàng nhanh', 10180000, '2021-06-10 18:11:22', '2021-06-10 18:11:22', 0),
(67, 'Lê Văn Long', 'Quang Hưng - Phù Cừ - Hưng Yên', 'levanlong@gmail.com', '0984079341', 'Giao hàng nhanh', 870000, '2021-06-10 18:18:49', '2021-06-10 18:18:49', 0),
(68, 'Lê Văn Long', 'Quang Hưng - Phù Cừ - Hưng Yên', 'levanlong@gmail.com', '0984079341', 'Giao hàng nhanh', 870000, '2021-06-10 20:30:26', '2021-06-10 20:30:26', 0),
(69, 'Lê Văn Long', 'Quang Hưng - Phù Cừ - Hưng Yên', 'levanlong@gmail.com', '0984079341', 'Giao hàng nhanh', 85000, '2021-06-10 20:36:27', '2021-06-10 20:36:27', 0),
(70, 'Lê Văn Long', 'Quang Hưng - Phù Cừ - Hưng Yên', 'levanlong@gmail.com', '0984079341', 'Giao hàng nhanh', 350000, '2021-06-15 19:34:40', '2021-06-15 19:34:40', 0);

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `order_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `producer`
--

CREATE TABLE `producer` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `producer`
--

INSERT INTO `producer` (`id`, `name`, `address`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES
(14, 'Xưởng gốm Hoàng Phát', 'Số 22, Phố Gốm (xóm 6), Giang Cao, Bát Tràng, Gia Lâm, Hà Nội', 'hoangphatbattrang@gmail.com', '987654321', 'Còn nhập hàng', '2021-05-21 02:11:58', '2021-05-21 02:14:38'),
(15, 'Xưởng gốm Trường An', 'Số 1 ngõ 239 Thôn 4 Giang Cao, Bát Tràng, Gia Lâm, Hà Nội', 'truongan@gmail.com', '987654322', 'Còn nhập hàng', '2021-05-21 02:13:46', '2021-05-21 02:13:58');

-- --------------------------------------------------------

--
-- Table structure for table `producers`
--

CREATE TABLE `producers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `origin` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `material` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipment_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `introduction` varchar(4000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amountsp` int(11) NOT NULL,
  `product_type_id` int(10) UNSIGNED NOT NULL,
  `producer_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `import_prices` int(50) NOT NULL,
  `sales_prices` int(50) NOT NULL,
  `show_home` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `image`, `size`, `origin`, `material`, `note`, `shipment_number`, `introduction`, `status`, `amountsp`, `product_type_id`, `producer_id`, `created_at`, `updated_at`, `import_prices`, `sales_prices`, `show_home`) VALUES
(32, 'Tranh gốm sứ tứ quý bốn mùa TGS04', 'tranhgomtuquy1.jpg', '42x82cm', 'Làng gốm Bát Tràng - Việt Nam', 'Gốm sứ', 'Hàng dê vỡ, nhẹ tay', 'TRG01', 'Tranh gốm sứ tứ quý bốn mùa cỡ nhỏ 3D  thường được treo trong phòng khách, thư phòng, phòng làm việc. Bộ tranh tô điểm cho ngôi nhà và đem lại may mắn, tài lộc cho gia chủ.', 'Còn hàng', 5, 20, 14, '2021-05-21 02:17:42', '2021-05-21 02:17:42', 3500000, 2690000, 1),
(33, 'Tranh gốm sứ chữ thư pháp Phúc Lộc Thọ', 'tranhgomphucloctho.jpg', '48cmx48cm', 'Làng gốm Bát Tràng - Việt Nam', 'Gốm sứ', 'Hàng dê vỡ, nhẹ tay', 'TRG01', 'Bộ tranh Phúc Lộc Thọ là ba điều mơ ước muôn thuở của mỗi người, mỗi nhà và đem lại may mắn cho gia chủ. Người ta cũng thường hay sử dụng tượng ông thọ để tặng cho ông bà hay cha mẹ vào những dịp như mừng thọ với mong ước người được nhận trường thọ, sông lâu trăm tuổi', 'Còn hàng', 5, 20, 14, '2021-05-21 02:21:33', '2021-05-21 02:21:33', 3500000, 2640000, 1),
(34, 'Tranh gốm sứ tứ quý nổi 3D bốn mùa', 'Tranhgomdapnoi1.jpg', '1m52', 'Làng gốm Bát Tràng - Việt Nam', 'Gốm sứ', 'Hàng dê vỡ, nhẹ tay', 'TRG01', 'Tranh gốm sứ tứ quý nổi 3D bốn mùa 1m52 SP4444 biểu tượng của bốn mùa nhưng tứ quý trong quan niệm dân gian không còn là một biểu tượng riêng của thời tiết hay khí hậu nữa mà đã biến thành biểu tượng của nhiều điều tốt lành khác. Đặc biệt, khi đã trở thành một biểu tượng của sự may mắn, tứ quý trở thành một niềm ước vọng của mọi người.', 'Còn hàng', 5, 20, 14, '2021-05-21 02:25:13', '2021-05-21 02:25:13', 5000000, 3090000, 1),
(37, 'Lọ hoa trang trí men rạn hoa cẩm tú cầu', 'lohoacamtucau1.jpg', '55 cm, 50 cm, 45 cm', 'Làng gốm Bát Tràng - Việt Nam', 'Gốm sứ', 'Hàng dê vỡ, nhẹ tay', 'GTT1', 'Với những ý nghĩa pha trộn màu như vậy sau một bông hoa, điều quan trọng là phải ghép hoa cẩm tú cầu với hoa khác để đảm bảo bạn có được ý nghĩa đúng. Bộ 3 lọ hoa dáng tỏi trang trí dùng để trang trí nhà cửa hoặc có thể làm quà biếu tặng tân gia, khách hàng, đối tác...', 'Còn hàng', 5, 21, 14, '2021-05-21 02:44:30', '2021-05-21 02:44:30', 2300000, 2000000, 1),
(38, 'Lọ hoa trang trí men rạn hoa sen', 'lohoadangtoihoasen1.jpg', '55', 'Làng gốm Bát Tràng - Việt Nam', 'Gốm sứ', 'Hàng dê vỡ, nhẹ tay', 'GTT1', 'Bộ lọ hoa trang trí men rạn hoa sen là một lọai hoa thanh khiết và có truyền thống lâu đời nhất ở phương Đông, là đại diện đặc biệt của nền văn hóa phật giáo. Hoa sen mọc trong bùn, sống trong bùn nhưng vượt lên khỏi nó để hướng đến mặt trời mà không hề bị bùn làm ô nhiễm, vấy bẩn. Cũng giống như một người được sinh ra trên thế giới, tồn tại giữa cuộc đời nhưng đã vượt thoát khỏi sự tham lam, sâu hận, dục vọng và không bị vấy bẩn, ô nhiễm bởi dòng đời.', 'Còn hàng', 5, 21, 14, '2021-05-21 02:49:18', '2021-05-21 02:49:18', 2300000, 2000000, 1),
(39, 'Bình hút lộc Phúc Lộc Thọ SP4629', 'lohoaphucloctho.jpg', '35 cm', 'Làng gốm Bát Tràng - Việt Nam', 'Gốm sứ', 'Hàng dê vỡ, nhẹ tay', 'GTT1', 'Bình hút tài lộc Phúc Lộc Thọ cao 30 cm là những đặc sản cao cấp nhất của làng cổ truyền gốm sứ Bát Tràng. Miệng bình mở rộng, cổ thon tượng trưng cho tài lộc vào qua cổ hẹp còn đáy bình rộng cực đại mang ý nghĩa tài lộc sẽ ở lại gia đình trong một thời gian dài. Bình tài lộc là biểu tượng của may mắn. Nếu đặt bình tài lộc trong nhà sẽ giúp gia chủ bảo quản được tài lộc, các thành viên trong gia đình hòa thuận, bình an.', 'Còn hàng', 5, 21, 14, '2021-05-21 02:55:30', '2021-05-21 02:55:30', 2000000, 1500000, 1),
(40, 'Chóe phong thủy công đào đắp nổi dát vàng', 'choephongthuy1.jpg', '60 cm', 'Làng gốm Bát Tràng - Việt Nam', 'Cao lanh', 'Hàng dê vỡ, nhẹ tay', 'GPT1', 'Chóe phong thủy công đào đắp nổi dát vàng được dùng đựng nước, gia chủ xin nước trong chóe để thay nước hoặc bao xái ban thờ. Chóe đắp nổi dát vàng xanh ngọc được làm đất cao lanh, tạo nên từ đôi bàn tay khéo léo của người nghệ nhân và thợ gốm, chim công hoa đào trên sản phẩm ý nghĩa mang lại may mắn tài lộc và bình an cho gia chủ.', 'Còn hàng', 5, 22, 14, '2021-05-21 03:02:45', '2021-05-21 03:02:45', 6500000, 6000000, 1),
(41, 'Chóe phong thủy đắp nổi dát vàng  24k', 'choedatvang24k.jpg', 'Cao 60 cm', 'Làng gốm Bát Tràng - Việt Nam', 'Gốm sứ', 'Hàng dê vỡ, nhẹ tay', 'GPT1', 'Chóe phong thủy công đào đắp nổi dát vàng được dùng đựng nước, gia chủ xin nước trong chóe để thay nước hoặc bao xái ban thờ. Chóe đắp nổi dát vàng xanh ngọc được làm đất cao lanh, tạo nên từ đôi bàn tay khéo léo của người nghệ nhân và thợ gốm, chim công hoa đào trên sản phẩm ý nghĩa mang lại may mắn tài lộc và bình an cho gia chủ.', 'Còn hàng', 5, 22, 14, '2021-05-21 03:09:47', '2021-05-21 03:09:47', 6300000, 6000000, 1),
(42, 'Hũ gạo tài lộc Phong Thủy gốm Bát Tràng', 'hugaotailoc1.jpg', 'Cao 40 cm', 'Làng gốm Bát Tràng - Việt Nam', 'Sành', 'Hàng dê vỡ, nhẹ tay', 'GPT1', 'Hũ gạo phong thủy tài lộc 10kg chất liệu sành, hút ẩm tốt chống ẩm mốc, phong thủy cho mọi nhà nên dùng.', 'Còn hàng', 5, 22, 14, '2021-05-21 03:13:29', '2021-05-21 03:13:29', 700000, 590000, 1),
(43, 'Ấm chén Tử sa dáng Trống ACTS17', 'amchentusadangtrong.jpg', '400 ml', 'Làng gốm Bát Tràng - Việt Nam', 'Đất tử sa', 'Hàng dê vỡ, nhẹ tay', 'GGD1', 'Ấm chén tử sa được làm từ đất tử sa quý hiếm, bình trà giữ nhiệt rất tốt, lưu giữ được hương vị của trà. Đây sẽ là sự lựa chọn hoàn hảo để tiếp khách hoặc tặng người thân, đối tác.', 'Còn hàng', 5, 23, 14, '2021-05-21 03:18:55', '2021-05-21 03:18:55', 400000, 350000, 1),
(44, 'Đèn xông tinh đầu in ấn cô dâu, chú rể', 'den-xong-tinh-dau-vo-chong-tre.png', 'Cao 15 cm', 'Làng gốm Bát Tràng - Việt Nam', 'Gốm sứ', 'Hàng dê vỡ, nhẹ tay', 'GGD1', 'Đèn xông tinh dầu in logo là sản phẩm truyền thống không thể thiếu trong các dịp kỷ niệm, gặp mặt, họp đồng hương, đồng ngũ, đồng niên và có mặt rất nhiều trong các dịp Đại hội Đảng, đại hội Hội Đồng Nhân Dân,  Ủy Ban Nhân Dân các cấp, cách ngành.', 'Còn hàng', 5, 23, 14, '2021-05-21 03:25:36', '2021-05-21 03:25:36', 400000, 350000, 1),
(45, 'Cốc in logo Tổng Thống Obama', 'cocintongthongobama.jpg', 'Cao 15 cm', 'Làng gốm Bát Tràng - Việt Nam', 'Gốm sứ', 'Hàng dê vỡ, nhẹ tay', 'GGD1', 'Gốm sứ quà tặng là một ngành vừa mới vừa cũ trong ngành quà tặng doanh nghiệp, cũ là vì những sản phẩm gốm sứ vốn là sản phẩm truyền thống có từ lâu đời nhưng mới là vì gốm sứ quà tặng đã được áp dụng công nghệ in ấn mới, in ấn lên gốm sứ nhanh chóng, không bong, không phai theo thời gian. Từ đó gốm sứ quà tặng luôn được khách hàng chọn lựa để làm món quà kết nối đối tác, tri ân khách hàng hay các hội nghị quảng bá thương hiệu.', 'Còn hàng', 5, 23, 14, '2021-05-21 03:28:50', '2021-05-21 03:28:50', 100000, 85000, 1),
(46, 'Bộ đồ ăn Bát Tràng men trắng', 'bodoanmentrang.jpg', 'Đa dạng', 'Làng gốm Bát Tràng - Việt Nam', 'Sứ', 'Hàng dê vỡ, nhẹ tay', 'GGD1', 'Bộ đồ ăn Bát Tràng là có rất nhiều sản phẩm từ bát đĩa, ấm chén, ca cốc uống nước, các nồi sứ để đồ ăn.\n\nGốm Hoàng Phát chuyên các sản phẩm dành cho gia đình, nhà hàng, resort, khách sạn, ... bộ khay mứt, bộ sản phẩm hình lá, bộ đồ ăn hoa mặt trời .,....\nCác bộ đồ ăn đều được làm từ nguồn nguyên liệu sạch, chất men đảm bảo với sức khỏe, ngoài ra bộ đồ ăn còn là 1 tác phẩm nghệ thuật trên bàn ăn mà người nấu, trưng bày là nghệ sĩ sắp đặt để mang lại cho bữa ăn gia đình 1 bữa ăn ngon và đẹp mắt.\nGốm Hoàng Phát còn nhận tư vấn, chế tác các mẫu theo nhu cầu của khách hàng, in ấn thương hiệu làm quà tặng khách hàng.', 'Còn hàng', 10, 23, 14, '2021-05-21 04:23:04', '2021-05-21 04:23:04', 400000, 350000, 1),
(47, 'Tượng Phúc Lộc Thọ dát vàng cao cấp', 'bo-tam-da-dat-vang-cao-cap-1.jpg', 'Cao 20 cm', 'Làng gốm Bát Tràng - Việt Nam', 'Gốm sứ', 'Hàng dê vỡ, nhẹ tay', 'GTT1', 'Xưởng sản xuất gốm sứ Hoàng Phát chuyên cung cấp các loại tượng phong thủy như Tam Đa Phúc Lộc Thọ, các vị La Hán, các vị Phật, Bồ Tát ngoài ra còn có tượng Quan Công, Tào Tháo, Khổng Minh..v..v.. Cung cấp sỉ và lẻ các tượng phong thủy trên toàn quốc.', 'Còn hàng', 10, 25, 14, '2021-05-21 04:27:07', '2021-05-21 04:27:07', 1000000, 950000, 0),
(48, 'Bộ đồ ăn hoa mặt trời men hỏa biến 15 món', 'bo-do-an-hoa-mat-troi-men-hoa-bien-1.jpg', 'Đa dạng', 'Làng gốm Bát Tràng - Việt Nam', 'Gốm sứ', 'Hàng dê vỡ, nhẹ tay', 'GGD1', 'Bộ đồ ăn Bát Tràng là có rất nhiều sản phẩm từ bát đĩa, ấm chén, ca cốc uống nước, các nồi sứ để đồ ăn.\nGốm Hoàng Phát chuyên các sản phẩm dành cho gia đình, nhà hàng, resort, khách sạn ... bộ khay mứt, bộ sản phẩm hình lá, bộ đồ ăn hoa mặt trời .,....\nCác bộ đồ ăn đều được làm từ nguồn nguyên liệu sạch, chất men đảm bảo với sức khỏe, ngoài ra bộ đồ ăn còn là 1 tác phẩm nghệ thuật trên bàn ăn mà người nấu, trưng bày là nghệ sĩ sắp đặt để mang lại cho bữa ăn gia đình 1 bữa ăn ngon và đẹp mắt.\nGốm Hoàng Phát còn nhận tư vấn, chế tác các mẫu theo nhu cầu của khách hàng, in ấn thương hiệu làm quà tặng khách hàng.', 'Còn hàng', 10, 23, 14, '2021-05-21 04:33:07', '2021-05-21 04:33:07', 500000, 450000, 1),
(56, 'Tranh sứ vẽ cảnh đồng quê Việt Nam - 08', 'tranh gom ve canh dong que viet nam.jpg', '60cmx40cm', 'Làng gốm Bát Tràng - Việt Nam', 'Sứ', 'Sản phẩm thủ công, nung qua lửa nên kích thước có thể tăng giảm 10%', 'TRG01', 'Tranh sứ vẽ cảnh Đồng Quê Việt Nam là tác phẩm phác họa vẻ đẹp yên bình, tĩnh lặng của làng quê Việt Nam qua đôi bàn tay tài ba của những nghệ nhân làng gốm sứ bát tràng, nhưng không vì cái tĩnh lặng, yên bình ấy mà đánh mất đi cái vui tươi, tấp nập của những con người việt nam trong mùa gặt và chợ quê.\nTừ xưa đến nay Phong cảnh quê hương luôn là nguồn cảm hứng vô tận của người nghệ sĩ với tình cảm chân thành và vô cùng sâu lắng. Màu của tranh đồng quê là những màu tươi sáng nhất, gần gũi nhất, đầy sức quyến rũ và ngọt ngào, bình dị như những người dân quê, khỏe khoắn và sâu lắng. Từ đó toát lên bức tranh thiên nhiên tươi sáng, thơ mộng và hùng tráng từ đời sống lao động hàng ngày của người dân Việt Nam.\nBức tranh với hình ảnh một ngôi nhà nhỏ cạnh sông nước thơ mộng cùng với cảnh hai cha con căng vó câu cá, hai đứa trẻ ngồi chơi trước nhà gợi một cuộc sống bình dị, yên ấm nơi quê nhà.\nTranh đồng quê thích hợp để trưng bày phòng khách, phòng làm việc mang lại cho không gian sống của bạn thêm sang trọng, ý nghĩa và gần gũi với thiên nhiên. Bên cạnh đó, đây cũng là món quà vô cùng ý nghĩa để tặng bạn bè, người thân nhân các dịp đặc biệt.', 'Còn hàng', 5, 20, 14, '2021-06-18 11:00:23', '2021-06-18 11:00:23', 1700000, 1500000, 0),
(57, 'Tranh sứ vẽ cảnh đồng quê Việt Nam - 07', 'tranh-phong-canh-tranh-su-ve-canh-dong-que-viet-nam-07.jpg', '60cmx40cm', 'Làng gốm Bát Tràng - Việt Nam', 'Sứ', 'Sản phẩm thủ công, nung qua lửa nên kích thước có thể tăng giảm 10%', 'TRG01', 'Bức tranh làng quê Việt Nam là một tác phẩm nghệ thuật gốm độc đáo được tô vẽ bởi đôi bàn tay tài hoa của người thợ gốm Bát Tràng.\nHơi thở cuộc sống nơi làng quê, phong cảnh thanh bình đồng quê nông thôn Việt Nam được tái hiện rõ nét qua bố cục, mảng màu nhẹ nhàng và tình cảm người nghệ sĩ làng gốm.\nHình ảnh cây đa giếng nước sân đình, lũy tre xanh, những cánh cò chao nghiêng, dòng sông uốn khúc, cánh đồng lúa chín, những bác nông dân và cậu bé chăn trâu thả diều…tất cả hình ảnh này dường như đã đi vào kí ức và những hoài niệm thời thơ ấu.\nKhông biết từ bao giờ hình ảnh cây đa, giếng nước, con đò đã đi sâu vào văn hoá Việt Nam và trở thành nét đẹp của dân tộc. Cây đa cổ thụ ở dầu làng tỏa bóng mát che ánh nắng mặt trời cho  người nông dân sau một buổi cày bừa khó nhọc trên cánh đồng; cho những bà, những chị đi chợ về dừng chân nghỉ; cho những người lữ thứ bộ hành, cho những người gồng gánh buôn bán kiếm ăn..\nhông chỉ gắn liền với biết bao kỷ niệm tuổi thơ, Cây đa còn như một nhân chứng của thời gian, nhân chứng lịch sử chứng kiến bao thăng trầm biến động của bao thế hệ cha anh. Cây đa biểu trưng cho tinh thần đoàn kết, đùm bọc, tự lực, tự cường của dân tộc Việt Nam.\n\n Hình ảnh bến sông quê hương êm đềm trong chuỗi kỉ niệm tuổi thơ đầy ấm áp, một buổi chiều quê dưới cái nắng hoàng hôn dịu nhẹ, mặt nước gơn sóng lấp loáng ánh bạc, chiếc thuyền nan bồng bềnh trên sóng nước, làng quê ta sao thanh bình đến thế. Dòng sống quê hương, dòng sông kí ức hội tụ, chan chứa chân tình.\n   Đặc biệt, làng quê Việt Nam mang bóng dáng mẹ, người phụ nữ tần tảo, trung hậu, đảm đang. Làng quê ấy khơi nguồn hun đúc ý trí, sức mạnh tinh thần cho ta. Bởi vậy, trong tâm khảm mỗi người con đất Việt, dù đi đâu về đâu đều hướng về cội nguồn của mình với tình cảm thiêng liêng, thành kính. Đó cũng chính là ngọn nguồn của lòng yêu nước bất diệt.\n  Bức tranh là hình ảnh làng quê Việt Nam thu nhỏ gần giũ, thân thương. Sản phẩm được vẽ tay 100%, được nung qua 1300 độ C nên bền màu vĩnh cửu, không sợ phai bạc màu theo thời gian.', 'Còn hàng', 5, 20, 14, '2021-06-18 11:02:54', '2021-06-18 11:02:54', 1700000, 1500000, 0),
(58, 'Tranh tứ linh vẽ tay men lam khung gỗ gụ', 'tranh-su-bat-trang-ve-tu-linh-men-lam-ve-tay-khung-go-g.jpg', '80cmx40cm', 'Làng gốm Bát Tràng - Việt Nam', 'Gốm sứ', 'Sản phẩm thủ công, nung qua lửa nên kích thước có thể tăng giảm 10%', 'TRG01', 'ranh tứ linh vẽ tay men lam khung gỗ gụ là một trong những dòng tranh cao cấp nhất Bát Tràng hiện tại. Toàn bộ phần họa tiết được vẽ bằng tay hoàn toàn tinh tế, uyển chuyển. Với những họa tiết tứ linh yêu cầu tay nghề người nghệ nhân càng cao nét vẽ càng chân thực, có hồn. \nChất liệu men lam sáng bóng, sản phẩm đã qua nhiệt độ cao đảm bảo màu men trọn đời.\nTứ linh bao gồm Long – Lân – Quy – Phụng là bốn linh vật có sức mạnh phi thường tượng trưng cho trời đất, bắt nguồn từ tứ linh thần: Thanh Long, Bạch Hổ, Huyền Vũ và Chu Tước. Chúng được người xưa tạo ra từ bốn phương trời, đại diện cho 4 nguyên tố chính của trời đất nước, lửa, đất và gió\nRồng: Rồng là con vật đứng đầu trong tứ linh, Rồng đại diện cho quẻ Chấn, mang lại Dương khí, sự quật khởi, ý chí, công danh, tài lộc và quyền lực\nLân là linh vật được biết đến thứ 2 sau Rồng, dân gian cho rằng sự xuất hiện của Lân báo hiệu điểm lành, thái bình thịnh vượng sắp tới. Ngoài ra hình tượng Lân cũng được dùng để trấn giữ cửa nhà, hóa giải hung khí khi đối diện với cửa nhà khác, bị ngã ba, ngã tư, góc nhọn, đường vòng chiểu thẳng vào nhà.\n Quy (Rùa) là con vật duy nhất có thật trong tự nhiên. Rùa là một loài bò sát lưỡng cư có tuổi thọ cao và khả năng sống trong một thời gian mà không cần tới thức ăn do đó được ví với tinh thần thanh cao, thoát tục\nPhượng hoàng là một trong những loài chim quý được nhiều người yêu mến. Phượng được miêu tả có mỏ diều hâu dài, tóc trĩ, vảy cá chép , móng chim ưng và đuôi công Với ý nghĩa đầu đội công lý, mắt là mặt trời, mặt trǎng, lưng cõng bầu trời, lông là cây cỏ, cánh là gió, đuôi là tinh tú, chân là đất, vì thế phượng tượng trưng cho cả vũ trụ. Phượng hoàng có ý nghĩa tích cực, nó biểu thị cho đức hạnh, vẻ duyên dáng và thanh nhã.', 'Còn hàng', 5, 20, 15, '2021-06-18 11:19:07', '2021-06-18 11:19:07', 16000000, 15500000, 0),
(59, 'Tranh sứ vẽ cảnh đồng quê Việt Nam - 05', 'tranh-phong-canh-tranh-su-ve-canh-dong-que-viet-nam-05.jpg', '60cmx40cm', 'Làng gốm Bát Tràng - Việt Nam', 'Gốm sứ', 'Sản phẩm thủ công, nung qua lửa nên kích thước có thể tăng giảm 10%', 'TRG01', 'Ai trong số chúng ta cũng đều có lần sẽ rời xa quê hương, xa nơi chôn rau cắt rốn đến những vùng miền khác. Có thể ở những nơi xa đó có cuộc sống xa hoa hào nhoáng hơn quê nhà, có nhiều thú vui, những cảnh đẹp muôn hình vạn trạng….nhưng những thứ đó không thể níu kéo bước chân, tình cảm, lý trí mỗi người…nhớ về quê hương của mình.\n   Ngắm nhìn bức tranh vẽ canh đồng quê mới cảm nhận được quê hương là nơi có những ký ức tuổi thơ thật đẹp. Có hình ảnh người mẹ tôi ngày ngày đi chợ kiếm chút miếng cơm manh áo cho cả nhà, hình hảnh người con ở nhà cơi đùa chờ mẹ về, cánh đồng lúa chín bát ngát... Quê hương là cái nôi nuôi nấng tâm hồn trẻ thơ, để dù có lớn lên, có đi đâu ta cũng nhớ.\n Ai rồi cũng lớn, rồi xa quê, muốn quay lại tuổi thơ nhưng không thể, chỉ biết níu giữ kỷ niệm qua những bài hát, bức tranh. Tranh gốm sứ cảnh quê hương với những hình ảnh quen thuộc trong ký ức mỗi người như cây đa, giếng nước, dòng sông xanh biếc…., sẽ giúp chúng ta giữ lại những kỷ niệm, ôn lại một thời ta đã thế, quê hương ta đã thế.\nBức tranh là hình ảnh làng quê Việt Nam thu nhỏ gần giũ, thân thương. Sản phẩm được vẽ tay 100%, được nung qua 1300 độ C nên bền màu vĩnh cửu, không sợ phai bạc màu theo thời gian.\nSản phẩm sẽ là món quà đặc biệt dành tặng những người con sống và làm ăn xa qua, một lòng hướng về quê nhà', 'Còn hàng', 5, 20, 15, '2021-06-18 11:21:39', '2021-06-18 11:21:39', 1700000, 1500000, 2),
(60, 'Tranh sứ vẽ cảnh đồng quê Việt Nam - 03', 'tranh-phong-canh-tranh-su-ve-canh-dong-que-viet-nam-03.jpg', '60cmx40cm', 'Làng gốm Bát Tràng - Việt Nam', 'Gốm sứ', 'Sản phẩm thủ công, nung qua lửa nên kích thước có thể tăng giảm 10%', 'TRG01', 'Tranh sứ vẽ cảnh Đồng Quê Việt Nam là tác phẩm phác họa vẻ đẹp yên bình, tĩnh lặng của làng quê Việt Nam qua đôi bàn tay tài ba của những nghệ nhân làng gốm sứ bát tràng, nhưng không vì cái tĩnh lặng, yên bình ấy mà đánh mất đi cái vui tươi, tấp nập của những con người việt nam trong mùa gặt và chợ quê.\nTừ xưa đến nay Phong cảnh quê hương luôn là nguồn cảm hứng vô tận của người nghệ sĩ với tình cảm chân thành và vô cùng sâu lắng. Màu của tranh đồng quê là những màu tươi sáng nhất, gần gũi nhất, đầy sức quyến rũ và ngọt ngào, bình dị như những người dân quê, khoẻ khoắn và sâu lắng. Từ đó toát lên bức tranh thiên nhiên tươi sáng, thơ mộng và hùng tráng từ đời sống lao động hàng ngày của người dân Việt Nam.\nBức tranh với hình ảnh một ngôi nhà nhỏ cạnh sông nước thơ mộng cùng với cảnh chú bé chăn trâu mẹ đi chợ gợi một cuộc sống bình dị, yên ấm nơi quê nhà. \nTranh đồng quê thích hợp để trưng bày phòng khách, phòng làm việc mang lại cho không gian sống của bạn thêm sang trọng, ý nghĩa và gần gũi với thiên nhiên. Bên cạnh đó, đây cũng là món quà vô cùng ý nghĩa để tặng bạn bè, người thân nhân các dịp đặc biệt.', 'Còn hàng', 5, 20, 15, '2021-06-18 11:24:28', '2021-06-18 11:24:28', 1700000, 1500000, 2),
(61, 'Bộ 3 cốc men hỏa biến khắc hoa sen', 'bo-3-coc-qua-tang-hoa-sen-mau-de.jpg', 'Ø9cm cao 6,5cm', 'Làng gốm Bát Tràng - Việt Nam', 'Gốm sứ cao lanh, men hỏa biến Bát tràng', 'Sản phẩm thủ công, nung qua lửa nên kích thước có thể tăng giảm 10%', 'GGD1', 'Giữ nhiệt tốt. An toàn cho sức khỏe, Dễ dàng sử dụng. Thiết kế đẹp mắt. Màu sắc sang trọng, tinh tế. Thích hợp làm quà tặng khách hàng, doanh nghiệp hoặc gia đình, người thân và bạn bè.\nQuý khách có nhu cầu đặt mua sỉ hoặc lẻ, đặt in logo làm quà biếu quà tặng Hội nghị Hội thảo, quà tặng chương trình quảng cáo khuyến mãi...', 'Còn hàng', 10, 23, 14, '2021-06-18 11:32:10', '2021-06-18 11:32:10', 330000, 290000, 2),
(62, 'Bộ 3 cốc uống nước hỏa biến', 'bo-3-coc-qua-tang-men-hoa-bie_.jpg', 'Ø 8cm - H9cm', 'Làng gốm Bát Tràng - Việt Nam', 'Gốm sứ cao lanh, men hỏa biến Bát tràng', 'Sản phẩm thủ công, nung qua lửa nên kích thước có thể tăng giảm 10%', 'GGD1', 'Giữ nhiệt tốt. An toàn cho sức khỏe, Dễ dàng sử dụng. Thiết kế đẹp mắt. Màu sắc sang trọng, tinh tế. Thích hợp làm quà tặng khách hàng, doanh nghiệp hoặc gia đình, người thân và bạn bè.\nQuý khách có nhu cầu đặt mua sỉ hoặc lẻ, đặt in logo làm quà biếu quà tặng Hội nghị Hội thảo, quà tặng chương trình quảng cáo khuyến mãi...', 'Còn hàng', 10, 23, 14, '2021-06-18 11:34:20', '2021-06-18 11:34:20', 300000, 270000, 0),
(63, 'Bộ 3 cốc uống nước bảo an', 'bo-3-coc-tru-men-mau-hoa-bien.jpg', 'ø 7,5cm - H11cm', 'Làng gốm Bát Tràng - Việt Nam', 'Gốm sứ cao lanh, men hỏa biến Bát tràng', 'Sản phẩm thủ công, nung qua lửa nên kích thước có thể tăng giảm 10%', 'GGD1', 'Giữ nhiệt tốt. An toàn cho sức khỏe, Dễ dàng sử dụng. Thiết kế đẹp mắt. Màu sắc sang trọng, tinh tế. Thích hợp làm quà tặng khách hàng, doanh nghiệp hoặc gia đình, người thân và bạn bè.\nQuý khách có nhu cầu đặt mua sỉ hoặc lẻ, đặt in logo làm quà biếu quà tặng Hội nghị Hội thảo, quà tặng chương trình quảng cáo khuyến mãi...', 'Còn hàng', 10, 23, 14, '2021-06-18 11:35:57', '2021-06-18 11:35:57', 300000, 270000, 0),
(64, 'Hộp đựng bánh kẹo hoa đơn - dài 15cm', 'khay-dung-banh-mut-keo-hop-dung-banh-keo-hoa-don-dai-15cm.jpg', 'dài 15cm, rộng 8cm, cao 4cm', 'Làng gốm Bát Tràng - Việt Nam', 'Gốm sứ cao lanh', 'Sản phẩm thủ công, nung qua lửa nên kích thước có thể tăng giảm 10%', 'GGD1', 'Bên tách trà ngày tết, những câu chuyện sẽ thêm vui hơn với miếng mứt, viên kẹo ngọt ngào. Với hộp đựng mứt vẽ cá cách điệu sang trọng sẽ làm chúng trở nên hấp dẫn và thu hút hơn.\n Đối với bánh kẹo, mứt khô, có thể dùng các loại hộp nhiều ngăn phù hợp với sở thích của mỗi người. Trẻ em sẽ bị cuốn hút bởi những miếng mứt ngọt lịm, người lớn có thể thưởng thức bánh và hạt dưa thưởng thức cùng tách trà nóng, kết hợp với những câu chuyện gia đình chắc chắn sẽ là những giây phút khó quên nhất trong ngày Tết.\n Hãy chọn mua Hộp đựng bánh mứt kẹo của Bát Tràng cho gia mình mình trong ngày Tết vì những lí do sau:\n Vật trang trí đẹp mắt giúp căn phòng bạn trở nên đẹp và tràn ngập không khí ngày tết.\nThể tích lớn có thể sử dụng đựng các loại thực phẩm, đồ ăn…như bánh, mứt, kẹo, hạt dưa...\nNắp đậy thiết kế đẹp, bắt mắt, đậy khít ngăn gió, côn trùng, giữ thực phẩm luôn ngon và đảm bảo vệ sinh.\nPhù hợp với mọi gia đình. Cũng là món quà tặng tinh tế cho bạn bè và người thân trong dịp Tết sắp đến.\nSản phẩm được nung ở nhiệt độ cao 1.200 độ C, không còn sư lượng chì, tốt cho sức khỏe của gia đình bạn.\nSản phẩm chính hiệu Bát Tràng, loại I, làm hoàn toàn bằng phương pháp thủ công.', 'Còn hàng', 10, 23, 14, '2021-06-18 11:41:55', '2021-06-18 11:41:55', 220000, 200000, 2),
(65, 'Hộp đựng bánh mứt kẹo 6 chiếc dài 15cm', 'khay-dung-banh-mut-keo-hop-dung-banh-mut-keo-6-chiec-dai-15cm.jpg', 'dài 15cm, rộng 8cm, cao 4cm', 'Làng gốm Bát Tràng - Việt Nam', 'Gốm sứ cao lanh', 'Sản phẩm thủ công, nung qua lửa nên kích thước có thể tăng giảm 10%', 'GGD1', 'Bộ sản phẩm bao gồm: 6 hộp đựng bánh mứt kẹo Bát Tràng\n4 hộp vẽ hoa dây\n1 hộp vẽ cá \n1 hộp vẽ chuồn chuồn\n Hộp đựng bánh mứt kẹp Bát Tràng được làm hoàn toàn bằng phương pháp thủ công nhưng với thiết kế vô cùng hiện đại. Sản phẩm được vẽ bằng tay với từng đường nét tinh xảo, sắc nét, mềm mại.\n Nắp hộp có tay cầm được thiết kế hình cá vừa tiện lợi khi sử dụng vừa là 1 nét chấm phá độc đáo tạo sự riêng biệt cho sản phẩm.\n Sản phẩm gốm sứ  Bát Tràng được nung ở nhiệt độ 1.300 độ C đảm bảo không còn dư lượng chì, tốt cho sức khỏe của bạn cùng người thân.', 'Còn hàng', 10, 23, 14, '2021-06-18 11:43:39', '2021-06-18 11:43:39', 220000, 200000, 0),
(66, 'Bình ngâm rượu vẽ sơn thủy', 'binh-ngam-ruou-binh-ngam-ruou-ve-son-thuy-men-xanh-50-lit-24104-1.jpg', 'cao 70cm, chu vi 150cm', 'Làng gốm Bát Tràng - Việt Nam', 'Gốm sứ cao lanh', 'Sản phẩm thủ công, nung qua lửa nên kích thước có thể tăng giảm 10%', 'GGD1', 'Dung tích bình 60 lit (trong thiết kế)\nSản phẩm được sản xuất trực tiếp tại Bát Tràng\nQuý khách có nhu cầu đặt mua sỉ hoặc lẻ, đặt in logo làm quà biếu quà tặng Hội nghị Hội thảo, quà tặng chương trình quảng cáo khuyến mãi...', 'Còn hàng', 5, 23, 14, '2021-06-18 11:48:43', '2021-06-18 11:48:43', 2000000, 1850000, 0),
(67, 'Hũ sành đựng gạo tài lộc 30kg', 'hu-sanh-dung-ga_131418207585316812.jpg', 'cao 70cm, chu vi 150cm', 'Làng gốm Bát Tràng - Việt Nam', 'Gốm sứ cao lanh', 'Sản phẩm thủ công, nung qua lửa nên kích thước có thể tăng giảm 10%', 'GGD1', 'Trong bếp có vật dụng vô cùng quan trọng là hũ đựng gạo. Việc đặt hũ gạo ở đâu để vừa tránh được những điều không tốt, vừa mang lại tài lộc, thịnh vượng cho gia chủ là 1 việc mà không phải ai cũng rõ. Battrangonline.vn xin chia sẻ cùng khách hàng thông tin này\nĐặt hũ gạo ở phương vị \"thổ\" đương vượng, vì gạo của thóc lúa là thứ được cấy trồng từ đất và người xưa cất giữ lúa gạo trong hang động dưới đất.\nHũ gạo nên đặt ở hướng Tây Nam hoặc Đông Bắc của bếp và để sát mặt đất (phải kê lên để chống ẩm). Không đặt hướng Đông và đặt quá cao.', 'Còn hàng', 5, 23, 14, '2021-06-18 11:51:32', '2021-06-18 11:51:32', 1100000, 1000000, 0);

-- --------------------------------------------------------

--
-- Table structure for table `product_type`
--

CREATE TABLE `product_type` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `describle` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_type`
--

INSERT INTO `product_type` (`id`, `name`, `describle`, `created_at`, `updated_at`) VALUES
(20, 'Tranh gốm', 'Tranh làm bằng chất liệu gốm', '2021-05-21 01:18:12', '2021-05-21 01:18:12'),
(21, 'Gốm trang trí', 'Gốm dùng với mục đích trang trí', '2021-05-21 01:20:03', '2021-05-21 01:20:03'),
(22, 'Gốm phong thủy', 'Gốm dùng trong phong thủy', '2021-05-21 01:20:31', '2021-05-21 01:20:31'),
(23, 'Gốm gia dụng', 'Gốm dùng trong sinh hoạt hàng ngày', '2021-05-21 01:21:34', '2021-05-21 01:21:34'),
(24, 'Gốm làm quà tặng', 'Các sản phẩm gốm có in logo để làm quà tặng', '2021-05-21 01:22:26', '2021-05-21 01:22:26'),
(25, 'Tượng gốm sứ', 'Tượng được làm bằng gốm hoặc sứ', '2021-06-18 00:33:50', '2021-06-18 00:33:50'),
(26, 'Đồ thờ', 'Đồ thờ được làm bằng gốm hoặc sứ', '2021-06-18 00:34:40', '2021-06-18 00:34:40'),
(27, 'Đồ lưu niệm', 'Đồ lưu niệm được làm bằng gốm hoặc sứ', '2021-06-18 00:36:47', '2021-06-18 00:36:47');

-- --------------------------------------------------------

--
-- Table structure for table `rolemaster`
--

CREATE TABLE `rolemaster` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rolemaster`
--

INSERT INTO `rolemaster` (`id`, `name`, `created_at`, `updated_at`) VALUES
(3, 'Admin', '2021-05-16 17:00:00', '2021-05-17 18:25:24'),
(9, 'User', '2021-05-17 18:23:40', '2021-05-17 18:23:40');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `session_users`
--

CREATE TABLE `session_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `refresh_token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token_expried` datetime NOT NULL,
  `refresh_token_expried` datetime NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `session_users`
--

INSERT INTO `session_users` (`id`, `token`, `refresh_token`, `token_expried`, `refresh_token_expried`, `user_id`, `created_at`, `updated_at`) VALUES
(6, 'HsUjKhLsoIiEmbViMHe4tbsKvOSeeycR0xy2vQ3Z', '5e3pfOg8g9yCnNjoaIj2OlACcXrQ3853unvP4NMX', '2021-07-01 09:17:16', '2022-06-01 09:17:16', 73, '2021-06-01 02:17:16', '2021-06-01 02:17:16');

-- --------------------------------------------------------

--
-- Table structure for table `slide`
--

CREATE TABLE `slide` (
  `id` int(10) UNSIGNED NOT NULL,
  `slide_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `address`, `phone`, `password`, `role_id`, `created_at`, `updated_at`, `email`) VALUES
(69, 'Lê Xuân Thắng', 'Văn Giang - Hưng Yên', '0987654322', '1234567', 9, '2021-05-31 03:42:57', '2021-05-31 03:42:57', 'lexuanthanghy@gmail.com'),
(70, 'Lê Việt Hưng', 'Quang Hưng - Phù Cừ - Hưng Yên', '0987654321', '1234567', 9, '2021-05-31 03:45:46', '2021-05-31 03:45:46', 'leviethung@gmail.com'),
(71, 'Lê Văn Long', 'Quang Hưng - Phù Cừ - Hưng Yên', '0984079342', '1234567', 9, '2021-05-31 19:47:44', '2021-05-31 19:47:44', 'levanlong99pchyas@gmail.com'),
(73, 'Lê Văn Long', 'Quang Hưng - Phù Cừ - Hưng Yên', '0984079341', '$2y$10$6txGZGzWe/khPoO1Qz5DlOouKIlnMqLImDfF7VgGhEuEEtjTZX4Ge', 3, '2021-06-01 01:55:37', '2021-06-01 01:55:37', 'levanlong99pchy@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bill_import`
--
ALTER TABLE `bill_import`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bill_import_detail`
--
ALTER TABLE `bill_import_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bill_import_detail_bill_import_id_foreign` (`bill_import_id`),
  ADD KEY `bill_import_detail_product_id_foreign` (`product_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `introduction`
--
ALTER TABLE `introduction`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `news_new_type_id_foreign` (`new_type_id`);

--
-- Indexes for table `new_type`
--
ALTER TABLE `new_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_detail_order_id_foreign` (`order_id`),
  ADD KEY `order_detail_product_id_foreign` (`product_id`);

--
-- Indexes for table `producer`
--
ALTER TABLE `producer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `producers`
--
ALTER TABLE `producers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_product_type_id_foreign` (`product_type_id`),
  ADD KEY `product_producer_id_foreign` (`producer_id`);

--
-- Indexes for table `product_type`
--
ALTER TABLE `product_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rolemaster`
--
ALTER TABLE `rolemaster`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `session_users`
--
ALTER TABLE `session_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `session_users_user_id_foreign` (`user_id`);

--
-- Indexes for table `slide`
--
ALTER TABLE `slide`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bill_import`
--
ALTER TABLE `bill_import`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bill_import_detail`
--
ALTER TABLE `bill_import_detail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `introduction`
--
ALTER TABLE `introduction`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `new_type`
--
ALTER TABLE `new_type`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `producer`
--
ALTER TABLE `producer`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `producers`
--
ALTER TABLE `producers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `product_type`
--
ALTER TABLE `product_type`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `rolemaster`
--
ALTER TABLE `rolemaster`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `session_users`
--
ALTER TABLE `session_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `slide`
--
ALTER TABLE `slide`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bill_import_detail`
--
ALTER TABLE `bill_import_detail`
  ADD CONSTRAINT `bill_import_detail_bill_import_id_foreign` FOREIGN KEY (`bill_import_id`) REFERENCES `bill_import` (`id`),
  ADD CONSTRAINT `bill_import_detail_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Constraints for table `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `news_new_type_id_foreign` FOREIGN KEY (`new_type_id`) REFERENCES `new_type` (`id`);

--
-- Constraints for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `order_detail_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`),
  ADD CONSTRAINT `order_detail_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_producer_id_foreign` FOREIGN KEY (`producer_id`) REFERENCES `producer` (`id`),
  ADD CONSTRAINT `product_product_type_id_foreign` FOREIGN KEY (`product_type_id`) REFERENCES `product_type` (`id`);

--
-- Constraints for table `session_users`
--
ALTER TABLE `session_users`
  ADD CONSTRAINT `session_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `rolemaster` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
