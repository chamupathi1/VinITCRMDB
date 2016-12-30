-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 30, 2016 at 12:12 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `vinit_crm`
--

-- --------------------------------------------------------

--
-- Table structure for table `block_unblock_client_note`
--

CREATE TABLE IF NOT EXISTS `block_unblock_client_note` (
  `client_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `note` varchar(1000) NOT NULL,
  `loggedTime` timestamp NULL DEFAULT NULL,
  `blocked` tinyint(1) NOT NULL,
  KEY `client_id` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `block_unblock_client_note`
--

INSERT INTO `block_unblock_client_note` (`client_id`, `user_id`, `note`, `loggedTime`, `blocked`) VALUES
(11, 1, 'Im blocking him', '2016-12-27 13:57:36', 1),
(11, 1, 'un blocking', '2016-12-27 13:57:51', 0),
(11, 1, 'blocking', '2016-12-27 14:14:26', 1),
(11, 1, 'ub', '2016-12-27 14:14:46', 0),
(3, 1, 'bad', '2016-12-27 17:49:03', 1),
(3, 1, 'good', '2016-12-27 17:49:25', 0),
(3, 1, 'k', '2016-12-27 17:50:45', 1),
(3, 1, 'kl', '2016-12-27 17:50:50', 0);

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE IF NOT EXISTS `branch` (
  `branch_id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`branch_id`),
  KEY `client_id` (`client_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`branch_id`, `client_id`, `name`, `location`) VALUES
(1, 1, 'london', 'london'),
(2, 1, 'UK', 'UK location'),
(3, 1, 'wall streat', 'london'),
(4, 2, 'london', 'london'),
(5, 8, 'aus', 'aus'),
(6, 8, 'america', 'america'),
(7, 5, 'amsterdam', 'amsterdam'),
(8, 6, 'london', 'london'),
(9, 6, 'new', 'new'),
(10, 6, 'india', 'india'),
(11, 6, 'galle', 'galle'),
(12, 3, 'london', 'london'),
(13, 3, 'london', 'london'),
(14, 3, 'london', 'london'),
(15, 1, 'aus', 'aus'),
(16, 11, 'london', ' london'),
(17, 3, 'us', 'usa');

-- --------------------------------------------------------

--
-- Table structure for table `call_record`
--

CREATE TABLE IF NOT EXISTS `call_record` (
  `call_id` int(11) NOT NULL AUTO_INCREMENT,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `description` varchar(1250) DEFAULT NULL,
  `time_duration` int(11) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`call_id`),
  KEY `client_id` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE IF NOT EXISTS `client` (
  `client_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `contact_person_name` varchar(255) DEFAULT NULL,
  `web_site` varchar(255) DEFAULT NULL,
  `stage_id` int(11) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `town` varchar(255) DEFAULT NULL,
  `mlr_number` varchar(255) DEFAULT NULL,
  `postal_code` varchar(255) DEFAULT NULL,
  `business_registration` varchar(255) DEFAULT NULL,
  `logo_file_name` varchar(255) DEFAULT NULL,
  `logo` blob,
  `support_time` int(11) DEFAULT NULL,
  `blocked` tinyint(1) NOT NULL,
  PRIMARY KEY (`client_id`),
  KEY `stage_id` (`stage_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`client_id`, `company_name`, `address`, `contact_person_name`, `web_site`, `stage_id`, `country`, `town`, `mlr_number`, `postal_code`, `business_registration`, `logo_file_name`, `logo`, `support_time`, `blocked`) VALUES
(1, 'test', 'test address', 'test contact', 'test.com', 1, 'UK', 'london', '1234', '12345', 'test bussiness reg', 'alex1.png', 0x89504e470d0a1a0a0000000d494844520000007a0000005108060000001d32b2110000001974455874536f6674776172650041646f626520496d616765526561647971c9653c00000d564944415478daec5d7b6c9657193f85726929e54ecb7d5cea5c860c71548110c0d00c567092e0604e03236a82263a13ffd0798997b94567a2fe2106cd8cb245e2d23402863842210243280409a058d7ac191410a450eea5dc7c7ee77b9feee9e939efa5f42b7c7dcf933c79bff7fe7ecfef3cd773def3e6ddbb774f79eaf994e781f6407bf2407bf2407bf2407bf2407bf2407bf2407bf2407bf2407ba01f565ab26449876d77efded58ce7c752d2c08103556969a91a3a74a8ba70e182eadfbfbfba7dfbb61a3264886a6a6a52870f1fe6437bf7ead5eb99debd7b57d2ef12e291c483880710e7e336c43789af10ff8fb881f83fc4c788eb03be9badffbd73e7ce2ebb567e1a5bf7d4a953556161a16a6e6ebe73e5ca95772f5ebc78a2b5b5b582401f97979717f7322703c0f7106f253efc30ffe75e29b66643893f42da3f61c08001e78a8a8aea0b0a0aac16c241e3881713ff987837f15f899f271ef630fed9b4697431f127892bc8843f79f3e6cdc7efdcb933a05fbf7e0a2093462b025c5dba7449d13ebd1e938a889f0af800f1ef03beee81ee5e9a48fc5c4343c36709c047c95febff0d20f3f3f3559f3e7d14f9e9362e2e2e5667cf9e5564d6154c7902730e9a19f06ae21f116ff140679f105cad25d0bed8d2d2328601039800b76fdfbefa37b673504a1aaeb78d1a354a3702f2df99a83519d80cf826e2d789bf4f7cca039d1dfa4c6363e3f7482ba70224800730011ea2702c41d866661ef0d13867e4c8915aeb11a9770268dd3e88bf40fc09e217896b7c30d6b55abc8ec079ebead5ab5359634100183e98410f4b2d79fff0e1c3755a1633407306fac47f26fe92d7e8aea1e904e47a0aaeca010c00655f8c740a5a0cf018f8a81a02ef07d8c8c3a9e17408d012d42110b0fd2a88ca5ff51add797a8a40de4c5a5b2ec10430943eb581dcceae06815658c0c5d71a316284f6e99db986a158af10ff2030eb1ee88454491afb474a91c6b1f001086b326b76a443354093e001646836afbb00765dc36804df25fe061f8fe7b4b107ba3d2d2653fd2669f3502968080ab931075d26084909ae00a555f8789bb98e736d710c0efa09f1e7bc46c7a319a4adaf130083a5a001048a20d0c2282d8bd0bc0e661cf5736e3cae73e35c3f2f43bfa09f1ff34087530909ea77649a4749c16b4718a45071cd74dc7ddc80a0d5f2b8fbd0ec61418056e481b6536f12d26b04e81326a01020b645f9d2ce80ce8cca994cdbe2fa6bc7bd3f4e8b979258961e9b5e99c114f9cb15f06f0014fbb8c0c105115b842d851f669aa3048c7b41ab71ef1b376eb40b9af89eaef44d56e00cfa4a9067d77a8dfe804a49602f9380f320703300835feeac66c4d57e342ea46c4922ee08ed4767cb77d0a6535d30911a4d1af5355a4c44ad5a46d4d0141c67faeb300d8b2a7884e5d688e8e3a66d61cf21b63d4d8b05b4bedd6bb4521f2241bc00e10068534b0072525fdc59cd87e5c03324cda95dc7d31271c7d7b385494e6834fb416af5cf93304ad8179b428586e158f6d961654d57e0c5c7f05025b94f3c479bbf455994a37c096492f2a8f0ddf388cb89f7a512e8800691403ecfc09b404b136f03d105b0dc8edf187080ae4a682c6200dc0beb2d2d2d7a1fb4188cdaf78c1933544949893a79f2a43a74e850bb483c6eb0673c17c6aa3d4bbff7a559a317113f22b54b6a0e0f1a7009d3053eaec30083264d9aa4c7948d1f3f5ea7516850d8d7dcdcaceaebebd5b163c7544343835ab060815abd7ab56e10d0fcf5ebd7abeaea6add38b8d1c87be21819a1b3b5905622001dff13c3939a52198c91102a89f35838a699648145812ccd299b79a44913274e548b172fd620bb8a2de5e5e5eaf2e5cb6aefdebdfa38aebce13a959595aaa6a6465dbb76cd6a6dccdab5ad961d9cf318f174fa5d9346d33d8af8493942440a32ac03c004593610800c6d9d376f9e5abe7cb94e99a2085abe68d1a20edbd9d403689b8f363557966b2d8d11e3dade216e499be92ea3459904cb2c54708f8f14aead6021f701e48a8a0a0d72d254c95648614025a8365f2c1b82a3d43a4765c699bf9f2aa049104f843dab99aad8022f337785b99e366d9a13640460e7cf9fd741186adbc3860d8bf39cb153b5309742db1fa5c58753073469c863a60698a62f6eea0442c40c33bd6cd9322bc8b5b5b56af7eeddeadcb973ead6ad5bda674f9830412d5cb8504d9e3cd90932c70e6c595c40dab4dd38b638f0d56fa74da3a784f95f9b2685e5b0006ff6ecd96aecd8b1edb6a301545555a91d3b762899ab5fbf7e5d0fff45c4bd72e54a3567ce9c508d0e8b0d22f268a602765569d3e81229342e6870e785ada4e8ca57394786d93669d7ae5d6afbf6ed7a548a793e022d34908d1b37eadc79ca9429d634d0e6a3234a9fb686911704a0e92a8192108a6d26db6696a3ca9f3c78c0d466bc8c074d462360136c1b4e049f8dc6608e0a951d2bb6dfb6f58812e9e0346a745fb3f4185270083593386fd0a0417a5890a453a74ee9a208f77eb92a6ad87fe2c4093dd61b03065dbe3aaa1266eeb7fc9f82d4011d8cb1ea507192437a6dd528578a05336c066178fd866be4610d054040ab51e33681961a9bb0c6dd56d59375a2346af46d06519a4cf85bd49dcda8db156df33ace331b05bf6417e77c1cc73d574980b645e2d2a548e0e95a77d2e8a3afcbd4451647b886cc02e375d31f4a30a0bdd0484963c68cd1552f348230dfd9dadaaa736a04642eb3cdccbd693696c79a3e3ed876238d4037b9fa72018cd43c9e05c1762c7765e2c539e4c892f09ed5cc993375b5ccd540706d008d0e0d9b46db52bd38a34e6d8d9296cda9039a04f1be4b23002ac096db6dbe560e4e0098c78f1fef701fd4b0a74f9faeb51d80b289c712e7a08e8d63d0b911a5cd72ddd4d6187c8ff8741a35ba2e4c0b008404d7ec38304187361e387040a754edaa14e4a7d7ac59a3962e5daa5330be361a07d2b155ab56a9152b56383b51e2a6523134ff06717d1aa3ee236145100ecc646a237dad19e5026880bc6ddb365de9320b23e87244e58c4ba06800a3478fd6cb08cb632d9824297f06db2ed3e278ea8026fa3709e32c2d4b5cd52569c225f87200a13c07a0eddfbf5f076173e7ceed7043bc2a0b4ed820adc51b5b81c755a20d80afa39f75a9039a02a8f7546606a0129b7648c0a181d0580e9e6c60b3f661fba64d9bf431f3e7cfbf5fabe37c41ce1c5d12a3c3e31de2ffa6ce4713dd24c1ec88534604a173420a97cdb8090c80c631007bc3860deacc9933910f828674f4e8d10efe3dec79ccfc3a46648e09c65a52a7d101607893e15bd4d28b6c1dfb66291160f33832b96e762630d818dc575757a73b3bcacacab4d91e3c78b0f6d988b8012c06011e3c78501d397244ad5dbb56cd9a35abedfef0e7e8e5325fd591cf1465b683e73a4ec7fce37e0742e42cd024ac7f611c15f133aed11ab2562c736a36a7661a26af8ffe691cbb67cf1eb579f3666dfe5114415f34522da45c48af700ceadd5bb66cd1e7a07fbab1b151776fa231f13832d7338599ed60df567aeea6ae9661ce0cf78510897f4dc2ad2441e4bb345a6e378b28b24384ab567c0c1a0106feb14906d0986f0c1d1d7c2d04707c3c469fac5bb74e57d35069e3010a32d28e3b1a55fc876b744c55576b732e018dd74af348a3de2670b61516163e6d0ed28f8a6a39329780f3f930b900149a8b61436073f48a493ccd051a071a0c836ceb7b4ed02ffd375acfca8b76b9924717928661acf35602e5a7988c86b60db7a531519ac36918c68c810132d6a1ad729e92b0b1e0666ddad63d2a1b5b547a15dc0bb5dc9fd3efbba9051ab10e054db5a5a5a5d5a4d555248cd324e0e16c92c3725236d50013e6150ccdc592a7bf80afe537336d3d4a51fe35ce6bb2aeeb88dff0cd3bbbfabde89cf3d144bf25a12c27509673ab97b56e80093f8edfbcce4bf91e15ce01a8187c8025e7d8bcdf054e67288e9f0eee874ad8cb0815b225bc5c31dd2cfc6f13cfa4f52166a18207f34980256066d7a1ecdb8ef302bccb04bb8a22725da6578e81fcebe898da6cca30d726943ba832f374bd66f38961698c597b0e8bd86deb512fe985bd7213d60942544bd778251b534ee55c65cca824fd92b83ace39364042aedbaec198015ed2896d6c83042d030d902f635a8b2bd996612e4e11798b04f45595999af9a35160ba800fdb6fbe2a13364c37ce35e55b9b42c361cf5f243773b05b8a4e2a37095322af52996f5c84d69ba32c441c2d4d306b81d34a18fb01f23789dfec2e81e5f2a4af47899f237e8b787c524d76f9e838952cdb60be84daff43e29f6900f2bb07825c9f39703ff1b32af3e59a4efbfdb89a1fa1a57134fd36f14b2a33e96bb77e9ea827cc050ab0f1bda4bf7755c017d608924e372982b2abc408bc5e7d1042ea29b3fbbe4bbc1445956c684adc79cb421ac711e24fd3cfdf3c2801f5a4f9ba91aa6086fb1754e69b54dd92ee454c3d758f188d0f9f4daa7990c2e9899f5af803f1fc40bbaf3ec09c1f95ae4f058deff483164a4ffdc0d97b8180f129c23fa9cc6707bb8bf0ddab2f132f20fecbc322909efe39a45d2af39539cca08bafcc2d231e9385fbc0726072990d2a334b41d3c32688347ce00cc1d9be80f1c1317c6dae82186fc2639e907e9dbc6e4e7d9b326d9f2cc40b576f045caa3265d4c75566be104c61805906d03356a03ef8da2c46639a5f9bfda7ea86afcd7669ece0bf1f9d0ef2407ba03d79a03d79a03d79a03d79a03d659bfe2fc0005e7bf34e9f6d92d10000000049454e44ae426082, 1998, 0),
(2, 'company 2', 'address 2', 'jane williams', 'two.company.com', 1, 'UK', 'london', 'number 3', '80000', '123456', 'alex2.png', 0x89504e470d0a1a0a0000000d494844520000007a0000005108060000001d32b211000000097048597300000b1300000b1301009a9c1800000a4f6943435050686f746f73686f70204943432070726f66696c65000078da9d53675453e9163df7def4424b8880944b6f5215082052428b801491262a2109104a8821a1d91551c1114545041bc8a088038e8e808c15512c0c8a0ad807e421a28e83a3888acafbe17ba36bd6bcf7e6cdfeb5d73ee7acf39db3cf07c0080c9648335135800ca9421e11e083c7c4c6e1e42e40810a2470001008b3642173fd230100f87e3c3c2b22c007be000178d30b0800c04d9bc0301c87ff0fea42995c01808401c07491384b08801400407a8e42a600404601809d98265300a0040060cb6362e300502d0060277fe6d300809df8997b01005b94211501a09100201365884400683b00accf568a450058300014664bc43900d82d00304957664800b0b700c0ce100bb200080c00305188852900047b0060c8232378008499001446f2573cf12bae10e72a00007899b23cb9243945815b082d710757572e1e28ce49172b14366102619a402ec27999193281340fe0f3cc0000a0911511e083f3fd78ce0eaecece368eb60e5f2deabf06ff226262e3fee5cfab70400000e1747ed1fe2c2fb31a803b06806dfea225ee04685e0ba075f78b66b20f40b500a0e9da57f370f87e3c3c45a190b9d9d9e5e4e4d84ac4425b61ca577dfe67c25fc057fd6cf97e3cfcf7f5e0bee22481325d814704f8e0c2ccf44ca51ccf92098462dce68f47fcb70bfffc1dd322c44962b9582a14e35112718e449a8cf332a52289429229c525d2ff64e2df2cfb033edf3500b06a3e017b912da85d6303f64b27105874c0e2f70000f2bb6fc1d4280803806883e1cf77ffef3ffd47a02500806649927100005e44242e54cab33fc708000044a0812ab0411bf4c1182cc0061cc105dcc10bfc6036844224c4c24210420a64801c726029ac82422886cdb01d2a602fd4401d34c051688693700e2ec255b80e3d700ffa61089ec128bc81090441c808136121da8801628a58238e08179985f821c14804128b2420c9881451224b91354831528a542055481df23d720239875c46ba913bc8003282fc86bc47319481b2513dd40cb543b9a8371a8446a20bd06474319a8f16a09bd072b41a3d8c36a1e7d0ab680fda8f3e43c730c0e8180733c46c302ec6c342b1382c099363cbb122ac0cabc61ab056ac03bb89f563cfb17704128145c0093604774220611e4148584c584ed848a8201c243411da093709038451c2272293a84bb426ba11f9c4186232318758482c23d6128f132f107b8843c437241289433227b9900249b1a454d212d246d26e5223e92ca99b34481a2393c9da646bb20739942c202bc885e49de4c3e433e41be421f25b0a9d624071a4f853e22852ca6a4a19e510e534e5066598324155a39a52dda8a15411358f5a42ada1b652af5187a81334759a39cd8316494ba5ada295d31a681768f769afe874ba11dd951e4e97d057d2cbe947e897e803f4770c0d861583c7886728199b18071867197718af984ca619d38b19c754303731eb98e7990f996f55582ab62a7c1591ca0a954a9526951b2a2f54a9aaa6aadeaa0b55f355cb548fa95e537dae46553353e3a909d496ab55aa9d50eb531b5367a93ba887aa67a86f543fa47e59fd890659c34cc34f43a451a0b15fe3bcc6200b6319b3782c216b0dab86758135c426b1cdd97c762abb98fd1dbb8b3daaa9a13943334a3357b352f394663f07e39871f89c744e09e728a797f37e8ade14ef29e2291ba6344cb931655c6baa96979658ab48ab51ab47ebbd36aeeda79da6bd45bb59fb810e41c74a275c2747678fce059de753d953dda70aa7164d3d3af5ae2eaa6ba51ba1bb4477bf6ea7ee989ebe5e809e4c6fa7de79bde7fa1c7d2ffd54fd6dfaa7f5470c5806b30c2406db0cce183cc535716f3c1d2fc7dbf151435dc34043a561956197e18491b9d13ca3d5468d460f8c69c65ce324e36dc66dc6a326062621264b4dea4dee9a524db9a629a63b4c3b4cc7cdcccda2cdd699359b3d31d732e79be79bd79bdfb7605a785a2cb6a8b6b86549b2e45aa659eeb6bc6e855a3959a558555a5db346ad9dad25d6bbadbba711a7b94e934eab9ed667c3b0f1b6c9b6a9b719b0e5d806dbaeb66db67d6167621767b7c5aec3ee93bd937dba7d8dfd3d070d87d90eab1d5a1d7e73b472143a563ade9ace9cee3f7dc5f496e92f6758cf10cfd833e3b613cb29c4699d539bd347671767b97383f3888b894b82cb2e973e2e9b1bc6ddc8bde44a74f5715de17ad2f59d9bb39bc2eda8dbafee36ee69ee87dc9fcc349f299e593373d0c3c843e051e5d13f0b9f95306bdfac7e4f434f8167b5e7232f632f9157add7b0b7a577aaf761ef173ef63e729fe33ee33c37de32de595fcc37c0b7c8b7cb4fc36f9e5f85df437f23ff64ff7affd100a78025016703898141815b02fbf87a7c21bf8e3f3adb65f6b2d9ed418ca0b94115418f82ad82e5c1ad2168c8ec90ad21f7e798ce91ce690e85507ee8d6d00761e6618bc37e0c2785878557863f8e7088581ad131973577d1dc4373df44fa449644de9b67314f39af2d4a352a3eaa2e6a3cda37ba34ba3fc62e6659ccd5589d58496c4b1c392e2aae366e6cbedffcedf387e29de20be37b17982fc85d7079a1cec2f485a716a92e122c3a96404c884e3894f041102aa8168c25f21377258e0a79c21dc267222fd136d188d8435c2a1e4ef2482a4d7a92ec91bc357924c533a52ce5b98427a990bc4c0d4cdd9b3a9e169a76206d323d3abd31839291907142aa214d93b667ea67e66676cbac6585b2fec56e8bb72f1e9507c96bb390ac05592d0ab642a6e8545a28d72a07b267655766bfcd89ca3996ab9e2bcdedccb3cadb90379cef9fffed12c212e192b6a5864b572d1d58e6bdac6a39b23c7179db0ae315052b865606ac3cb88ab62a6dd54fabed5797ae7ebd267a4d6b815ec1ca82c1b5016beb0b550ae5857debdcd7ed5d4f582f59dfb561fa869d1b3e15898aae14db1797157fd828dc78e51b876fcabf99dc94b4a9abc4b964cf66d266e9e6de2d9e5b0e96aa97e6970e6e0dd9dab40ddf56b4edf5f645db2f97cd28dbbb83b643b9a3bf3cb8bc65a7c9cecd3b3f54a454f454fa5436eed2ddb561d7f86ed1ee1b7bbcf634ecd5db5bbcf7fd3ec9bedb5501554dd566d565fb49fbb3f73fae89aae9f896fb6d5dad4e6d71edc703d203fd07230eb6d7b9d4d51dd23d54528fd62beb470ec71fbefe9def772d0d360d558d9cc6e223704479e4e9f709dff71e0d3ada768c7bace107d31f761d671d2f6a429af29a469b539afb5b625bba4fcc3ed1d6eade7afc47db1f0f9c343c59794af354c969dae982d39367f2cf8c9d959d7d7e2ef9dc60dba2b67be763cedf6a0f6fefba1074e1d245ff8be73bbc3bce5cf2b874f2b2dbe51357b8579aaf3a5f6dea74ea3cfe93d34fc7bb9cbb9aaeb95c6bb9ee7abdb57b66f7e91b9e37ceddf4bd79f116ffd6d59e393dddbdf37a6ff7c5f7f5df16dd7e7227fdcecbbbd97727eeadbc4fbc5ff440ed41d943dd87d53f5bfedcd8efdc7f6ac077a0f3d1dc47f7068583cffe91f58f0f43058f998fcb860d86eb9e383e3939e23f72fde9fca743cf64cf269e17fea2fecbae17162f7ef8d5ebd7ced198d1a197f29793bf6d7ca5fdeac0eb19afdbc6c2c61ebec97833315ef456fbedc177dc771defa3df0f4fe47c207f28ff68f9b1f553d0a7fb93199393ff040398f3fc63332ddb000000206348524d00007a25000080830000f9ff000080e9000075300000ea6000003a980000176f925fc546000003d24944415478daecdd5ba854551cc7f1cf31b3b4b2cc2e0f5a7623b32c028d288328a288088d82a8a85e32a2a287200982ee78c187887a098aea21a2e85e5448043e1815446950885d414c03a342ede4e59c1ed60e44f4cc8c673333679fdf170e0c67fdf7da7be63b6befb5d6feaf3d03c3c3c342f399908f20a2434487880e111d223a447488e810d121a2233a447488e810d121a2434487880e111d46646203dfd3a1988401ecc1bf186a63bb79b803f3b11d1fe139fcd9840f65a001396313703a66e32c9c84a3ab2ff120b6e2277c871ff0db7eeab8082fe1cc7dfeff1aeec4df11dd3b8ec37558847330ab45fc4eacc7977813abaa167f6cf57ade01b67b1c8f4474f7998edb7177d5920f865d5853099c8eb74688fd05e7e3af88ee1e5760292ea8a9be416cc26923c4ecc05cfc9c5e7717be905882f76a940c87b7900c8d487c9f38468e7105eecf20a9d92d7a6924375ff4bd78209a9a7dea9e8f273adc6608bf634bd5b39e8299981ad1fdc9642cc3316dc66fc6db7807df2a9324c3d5fb9b814b703dae5466cdc61dfd3abcba11afe09036625fc572ac6b23f65a3c89f33a3896ed3837c3abfa99545d9b5b49de8d87714b9b92e17d5c830fd319eb3d1763411b712baa6b78a7a7a48db80d9f45746f59a84c908cc427787414fbd85a9d35b64474ef68d59ab7572d79f728f7f3355e88e8de31b345f9ea1a4fbb2f6ac02dc8b12a7a7a8bf24f6b68cdfff3233e8fe8def5ba0fc44e2581a02e863be8b147741719b4ff0c91d1b039a2fb93a19aeb1b8ee8fee3309c58739d2744746fd8d542f49c9af73737a27bc3d616e597d578dcb39499b888ee019b5a945faebe74a25b312da27bc3172dcaa7e2c11af6331b8b8d13fa51f4bb6dc42c32bacc9323f1344e8ee8deb11a5fb511f718ee3988faa7294b6dae328ee847d18378b68df1ede42aee199cd266dd0baa33c6cdc619fd9a6172143eeea047bc41c934f900df63db5e65c7e342dca02ce1e9347fac111926fdbc52e3522513644a8752362ad39abbab563f4b996439d8fcb888ee020f29395ebd2439635d60399e171a2f7a0feec3cb51d56cd1f00feec24af5dfb98ae83e1c722d51f2bdd7d758ef90dc8fee4bde50565b2c5396de8c866faa21d7ca3662c7fc3debb1fc688b537193b2fae20ce55117adf8156bf1ba3271b24db91bb66a84e1d7da6a3cbf23a27bcb649c5d0d81e6286badf67e58cd1fd5d0689d3299b2619fed8f5096ff2c3c40fd8b9bd0f31f68e82fd94dac2e4b7baabf56cc50a652af569e824049ee7f4a591122a2433a6321a2434487880e111d223a44744487880e111d223a447488e810d121a24344477488e810d121a2434487eef3df00664cc9a39fba1d0f0000000049454e44ae426082, 3478, 1),
(3, 'abcd', '', '', '', 1, '', '', '', '', '', '', NULL, NULL, 0),
(4, 'abcd', '', '', '', 1, '', '', '', '', '', '', NULL, NULL, 0),
(5, 'test company 2', '', '', '', 1, '', '', '', '', '', '', NULL, NULL, 0),
(6, 'test company 2', 'sadf', 'asdf', 'adf', 1, 'Albania', 'adsf', 'adsf', 'null', 'adf', '', NULL, NULL, 1),
(7, 'test company 2', 'sadf', 'asdf', 'adf', 1, 'Albania', 'adsf', 'adsf', 'null', 'adf', '', NULL, NULL, 0),
(8, 'test company 2', 'sadf', 'asdf', 'adf', 1, 'Albania', 'adsf', 'adsf', 'null', 'adf', '', NULL, NULL, 0),
(9, 'jh', '', '', '', 1, '', '', '', '', '', '', NULL, NULL, 0),
(10, 'jh', '', '', '', 1, '', '', '', '', '', '', NULL, NULL, 0),
(11, 'jh', '', '', '', 1, '', '', '', '', '', '', NULL, NULL, 0),
(12, '', '', '', '', 1, 'Sri Lanka', '', '', '', '', '', NULL, NULL, 0),
(13, 'test company 2', '', 'james', '', 1, '', '', '', '', '', '', NULL, NULL, 0),
(14, 'abc', '', '', '', 1, 'United Kingdom', '', '', 'null', '', 'localhost:8080/logo_1482943087526.png', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Stand-in structure for view `client_blocked_history`
--
CREATE TABLE IF NOT EXISTS `client_blocked_history` (
`subject` varchar(14)
,`content` varchar(1000)
,`type` varchar(7)
,`id` char(0)
,`client_id` int(11)
,`branchName` char(0)
,`productName` char(0)
,`expireDate` char(0)
,`loggedTimeStamp` timestamp
,`loggedDate` varchar(10)
,`loggedTime` time
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `client_branch_add_history`
--
CREATE TABLE IF NOT EXISTS `client_branch_add_history` (
`subject` varchar(268)
,`content` varchar(255)
,`type` varchar(12)
,`id` int(11)
,`client_id` int(11)
,`branchName` varchar(255)
,`productName` char(0)
,`expireDate` char(0)
,`loggedTimeStamp` timestamp
,`loggedDate` varchar(10)
,`loggedTime` time
);
-- --------------------------------------------------------

--
-- Table structure for table `client_branch_log`
--

CREATE TABLE IF NOT EXISTS `client_branch_log` (
  `client_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `branch_added` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  `loggedTime` timestamp NULL DEFAULT NULL,
  KEY `client_id` (`client_id`),
  KEY `branch_id` (`branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `client_branch_log`
--

INSERT INTO `client_branch_log` (`client_id`, `branch_id`, `branch_added`, `user_id`, `loggedTime`) VALUES
(2, 1, 1, 1, '2016-12-06 18:30:00'),
(3, 14, 1, 1, '2016-12-26 13:39:46'),
(1, 15, 1, 1, '2016-12-27 07:17:42'),
(11, 16, 1, 1, '2016-12-27 15:09:58'),
(11, 16, 0, 1, '2016-12-27 18:30:00'),
(3, 17, 1, 1, '2016-12-27 17:48:33');

-- --------------------------------------------------------

--
-- Stand-in structure for view `client_branch_remove_history`
--
CREATE TABLE IF NOT EXISTS `client_branch_remove_history` (
`subject` varchar(270)
,`content` varchar(255)
,`type` varchar(14)
,`id` int(11)
,`client_id` int(11)
,`branchName` varchar(255)
,`productName` char(0)
,`expireDate` char(0)
,`loggedTimeStamp` timestamp
,`loggedDate` varchar(10)
,`loggedTime` time
);
-- --------------------------------------------------------

--
-- Table structure for table `client_fax`
--

CREATE TABLE IF NOT EXISTS `client_fax` (
  `client_id` int(11) NOT NULL DEFAULT '0',
  `fax` varchar(20) NOT NULL,
  PRIMARY KEY (`client_id`,`fax`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `client_fax`
--

INSERT INTO `client_fax` (`client_id`, `fax`) VALUES
(1, '+44123456789');

-- --------------------------------------------------------

--
-- Table structure for table `client_mail`
--

CREATE TABLE IF NOT EXISTS `client_mail` (
  `client_id` int(11) NOT NULL DEFAULT '0',
  `mail` varchar(255) NOT NULL,
  PRIMARY KEY (`client_id`,`mail`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `client_mail`
--

INSERT INTO `client_mail` (`client_id`, `mail`) VALUES
(1, 'testuser1@test1.com'),
(1, 'testuseremail2@test1.com'),
(8, 'chamupathi2008@gmail.com'),
(10, 'chamupathi2008@gmail.com'),
(11, 'chamupathi2008@gmail.com'),
(13, 'test@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `client_note`
--

CREATE TABLE IF NOT EXISTS `client_note` (
  `client_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `note` varchar(1000) NOT NULL,
  `loggedTime` timestamp NULL DEFAULT NULL,
  KEY `client_id` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `client_note`
--

INSERT INTO `client_note` (`client_id`, `user_id`, `subject`, `note`, `loggedTime`) VALUES
(4, 1, 'dsfj', 'note', '2016-12-21 18:30:00'),
(3, 1, 'sub', 'alkfj', '2016-12-26 07:03:24'),
(3, 1, 'my subject', 'note', '2016-12-26 07:04:02'),
(1, 1, 'a longer note', 'this is some longer note. this is some longer note. this is some longer note. this is some longer note. this is some longer note. this is some longer note. this is some longer note. this is some longer note. this is some longer note. this is some longer note. this is some longer note. ', '2016-12-27 12:38:58'),
(1, 1, 'my note', 'my note', '2016-12-27 13:03:17'),
(1, 1, 'my note la', 'd', '2016-12-27 13:03:32'),
(1, 1, 'a larger adlkfjsadl', 's', '2016-12-27 13:03:55'),
(1, 1, 'a larer', 'd', '2016-12-27 13:04:40'),
(1, 1, 'a larer', 'd', '2016-12-27 13:04:40'),
(1, 1, 'note', 'large largelarge largelarge largelarge largelarge largelarge largelarge largelarge largelarge largelarge largelarge largelarge largelarge largelarge largelarge largelarge largelarge largelarge largelarge large', '2016-12-27 13:05:14'),
(11, 1, 'this is a note', 'this is a note content', '2016-12-27 14:07:32'),
(1, 1, 'this', 'this is an example', '2016-12-27 17:24:23');

-- --------------------------------------------------------

--
-- Table structure for table `client_phone`
--

CREATE TABLE IF NOT EXISTS `client_phone` (
  `client_id` int(11) NOT NULL DEFAULT '0',
  `phone` varchar(20) NOT NULL,
  PRIMARY KEY (`client_id`,`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `client_phone`
--

INSERT INTO `client_phone` (`client_id`, `phone`) VALUES
(1, '+44123444444'),
(1, '+44123456789');

-- --------------------------------------------------------

--
-- Table structure for table `client_product`
--

CREATE TABLE IF NOT EXISTS `client_product` (
  `client_id` int(11) NOT NULL DEFAULT '0',
  `product_Id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`client_id`,`product_Id`),
  KEY `product_Id` (`product_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `client_product`
--

INSERT INTO `client_product` (`client_id`, `product_Id`) VALUES
(1, 1),
(1, 2),
(2, 2),
(3, 3),
(11, 3),
(1, 4),
(3, 4),
(1, 5);

-- --------------------------------------------------------

--
-- Stand-in structure for view `client_product_added_history`
--
CREATE TABLE IF NOT EXISTS `client_product_added_history` (
`subject` varchar(269)
,`content` varchar(255)
,`type` varchar(13)
,`id` int(11)
,`client_id` int(11)
,`branchName` char(0)
,`productName` varchar(255)
,`expireDate` char(0)
,`loggedTimeStamp` timestamp
,`loggedDate` varchar(10)
,`loggedTime` time
);
-- --------------------------------------------------------

--
-- Table structure for table `client_product_log`
--

CREATE TABLE IF NOT EXISTS `client_product_log` (
  `client_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_added` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  `loggedTime` timestamp NULL DEFAULT NULL,
  KEY `client_id` (`client_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `client_product_log`
--

INSERT INTO `client_product_log` (`client_id`, `product_id`, `product_added`, `user_id`, `loggedTime`) VALUES
(3, 3, 1, 1, '2016-12-26 13:13:04'),
(1, 1, 1, 1, '2016-12-11 18:30:00'),
(1, 2, 1, 1, '2016-12-27 07:11:57'),
(11, 3, 1, 1, '2016-12-27 15:53:49'),
(1, 1, 1, 1, '2016-12-27 17:25:47'),
(1, 4, 1, 1, '2016-12-27 17:25:47'),
(3, 4, 1, 1, '2016-12-27 17:45:37'),
(1, 5, 1, 1, '2016-12-28 12:20:18');

-- --------------------------------------------------------

--
-- Stand-in structure for view `client_product_removed_history`
--
CREATE TABLE IF NOT EXISTS `client_product_removed_history` (
`subject` varchar(271)
,`content` varchar(255)
,`type` varchar(15)
,`id` int(11)
,`client_id` int(11)
,`branchName` char(0)
,`productName` varchar(255)
,`expireDate` char(0)
,`loggedTimeStamp` timestamp
,`loggedDate` varchar(10)
,`loggedTime` time
);
-- --------------------------------------------------------

--
-- Table structure for table `client_till_log`
--

CREATE TABLE IF NOT EXISTS `client_till_log` (
  `client_id` int(11) NOT NULL,
  `till_id` int(11) NOT NULL,
  `till_added` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  `loggedTime` timestamp NULL DEFAULT NULL,
  KEY `client_id` (`client_id`),
  KEY `till_id` (`till_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `client_till_log`
--

INSERT INTO `client_till_log` (`client_id`, `till_id`, `till_added`, `user_id`, `loggedTime`) VALUES
(2, 1, 1, 1, '2016-12-26 18:30:00'),
(3, 15, 1, 1, '2016-12-26 15:49:18'),
(1, 18, 1, 1, '2016-12-27 07:22:44'),
(11, 19, 1, 1, '2016-12-27 15:57:54'),
(1, 20, 1, 1, '2016-12-28 12:21:04'),
(1, 21, 1, 1, '2016-12-28 12:39:26'),
(1, 22, 1, 1, '2016-12-28 12:41:29'),
(1, 23, 1, 1, '2016-12-28 12:43:01'),
(1, 24, 1, 1, '2016-12-28 12:50:30'),
(1, 25, 1, 1, '2016-12-28 13:01:18'),
(2, 26, 1, 1, '2016-12-29 19:04:27');

-- --------------------------------------------------------

--
-- Stand-in structure for view `client_unblocked_history`
--
CREATE TABLE IF NOT EXISTS `client_unblocked_history` (
`subject` varchar(16)
,`content` varchar(1000)
,`type` varchar(9)
,`id` char(0)
,`client_id` int(11)
,`branchName` char(0)
,`productName` char(0)
,`expireDate` char(0)
,`loggedTimeStamp` timestamp
,`loggedDate` varchar(10)
,`loggedTime` time
);
-- --------------------------------------------------------

--
-- Table structure for table `customer_stage`
--

CREATE TABLE IF NOT EXISTS `customer_stage` (
  `stage_id` int(11) NOT NULL AUTO_INCREMENT,
  `stage` varchar(255) NOT NULL,
  `stage_color` varchar(255) NOT NULL,
  PRIMARY KEY (`stage_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `customer_stage`
--

INSERT INTO `customer_stage` (`stage_id`, `stage`, `stage_color`) VALUES
(1, 'potential', 'yellow'),
(2, 'pre-sale', 'brown'),
(3, 'existing', 'green'),
(4, 'old', 'brown');

-- --------------------------------------------------------

--
-- Table structure for table `developers`
--

CREATE TABLE IF NOT EXISTS `developers` (
  `developer_id` int(11) NOT NULL AUTO_INCREMENT,
  `developer_name` varchar(255) NOT NULL,
  `developer_company_id` varchar(255) NOT NULL,
  PRIMARY KEY (`developer_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `developers`
--

INSERT INTO `developers` (`developer_id`, `developer_name`, `developer_company_id`) VALUES
(1, 'developer 1', 'developer 1 company Id'),
(2, 'developer 2', 'developer 2 company id');

-- --------------------------------------------------------

--
-- Stand-in structure for view `note_history`
--
CREATE TABLE IF NOT EXISTS `note_history` (
`subject` varchar(255)
,`content` varchar(1000)
,`type` varchar(4)
,`id` char(0)
,`client_id` int(11)
,`branchName` char(0)
,`productName` char(0)
,`expireDate` char(0)
,`loggedTimeStamp` timestamp
,`loggedDate` varchar(10)
,`loggedTime` time
);
-- --------------------------------------------------------

--
-- Table structure for table `priorities`
--

CREATE TABLE IF NOT EXISTS `priorities` (
  `priority_id` int(11) NOT NULL AUTO_INCREMENT,
  `priority_name` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`priority_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `priorities`
--

INSERT INTO `priorities` (`priority_id`, `priority_name`, `color`) VALUES
(1, 'LOW', 'green'),
(2, 'MEDIUM', 'yellow'),
(3, 'HIGH', 'red');

-- --------------------------------------------------------

--
-- Table structure for table `problem_types`
--

CREATE TABLE IF NOT EXISTS `problem_types` (
  `problem_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `problem_type_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`problem_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `problem_types`
--

INSERT INTO `problem_types` (`problem_type_id`, `problem_type_name`) VALUES
(1, 'type 1'),
(2, 'other');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `product_Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`product_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_Id`, `name`, `description`) VALUES
(1, 'MX', 'MX'),
(2, 'MXP', 'MXP'),
(3, 'Money Xpress', 'Money Xpress'),
(4, 'Digital Display', 'Digital Display'),
(5, 'Web Sync', 'Web Sync'),
(6, 'Money Exchange web', 'Money Exchange web');

-- --------------------------------------------------------

--
-- Table structure for table `support_contract`
--

CREATE TABLE IF NOT EXISTS `support_contract` (
  `contract_id` int(11) NOT NULL AUTO_INCREMENT,
  `contract_file_name` varchar(255) DEFAULT NULL,
  `contract` blob,
  `client_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`contract_id`),
  KEY `client_id` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE IF NOT EXISTS `tickets` (
  `ticket_id` int(11) NOT NULL AUTO_INCREMENT,
  `swimlane_status_id` int(11) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `description` varchar(1100) DEFAULT NULL,
  `problem_type_id` int(11) DEFAULT NULL,
  `priority_id` int(11) DEFAULT NULL,
  `assignee_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `sceenshot_name` varchar(255) DEFAULT NULL,
  `due_date` date NOT NULL,
  PRIMARY KEY (`ticket_id`),
  KEY `swimlane_status_id` (`swimlane_status_id`),
  KEY `client_id` (`client_id`),
  KEY `problem_type_id` (`problem_type_id`),
  KEY `priority_id` (`priority_id`),
  KEY `assignee_id` (`assignee_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`ticket_id`, `swimlane_status_id`, `client_id`, `summary`, `description`, `problem_type_id`, `priority_id`, `assignee_id`, `user_id`, `sceenshot_name`, `due_date`) VALUES
(1, 2, 1, 'sum', 'des', 1, 1, 1, 1, 'screenshot_1483080099746.png', '2016-12-31'),
(2, 1, 1, 'sum2', 'des 2', 1, 1, 1, 1, NULL, '2016-12-31'),
(3, 1, 1, 'sum2', 'des 2', 1, 3, 1, 1, 'screenshot_1483081177301.png', '2016-12-31'),
(4, 2, 1, 'sum2', 'des 2', 1, 2, 1, 1, 'screenshot_1483081236296.png', '2016-12-31'),
(5, 2, 1, 'sum2', 'des 2', 1, 2, 1, 1, 'screenshot_1483081351064.png', '2016-12-31'),
(6, 1, 1, 'sum2', 'des 2', 1, 3, 1, 1, 'screenshot_1483081400222.png', '2016-12-31');

-- --------------------------------------------------------

--
-- Table structure for table `ticketswimlane`
--

CREATE TABLE IF NOT EXISTS `ticketswimlane` (
  `swimlane_id` int(11) NOT NULL AUTO_INCREMENT,
  `swimlane_status` varchar(255) NOT NULL,
  `swimlane_color` varchar(255) NOT NULL,
  PRIMARY KEY (`swimlane_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `ticketswimlane`
--

INSERT INTO `ticketswimlane` (`swimlane_id`, `swimlane_status`, `swimlane_color`) VALUES
(1, 'open', 'green'),
(2, 'in progress', 'yellow'),
(3, 'Tobe discussed', '#ccc');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_swimlane_log`
--

CREATE TABLE IF NOT EXISTS `ticket_swimlane_log` (
  `ticket_id` int(11) NOT NULL,
  `swimlane_status_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `loggedTime` timestamp NULL DEFAULT NULL,
  KEY `ticket_id` (`ticket_id`),
  KEY `swimlane_status_id` (`swimlane_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ticket_swimlane_log`
--

INSERT INTO `ticket_swimlane_log` (`ticket_id`, `swimlane_status_id`, `user_id`, `loggedTime`) VALUES
(1, 1, 0, '2016-12-30 06:41:39'),
(6, 1, 1, '2016-12-30 07:03:21'),
(4, 2, 1, '2016-12-30 07:14:22'),
(6, 2, 1, '2016-12-30 07:20:04'),
(6, 1, 1, '2016-12-30 07:21:51'),
(6, 2, 1, '2016-12-30 07:25:27'),
(5, 2, 1, '2016-12-30 07:26:50'),
(6, 2, 1, '2016-12-30 08:05:36'),
(6, 1, 1, '2016-12-30 08:08:37'),
(6, 2, 1, '2016-12-30 08:09:27'),
(5, 2, 1, '2016-12-30 08:09:40'),
(5, 1, 1, '2016-12-30 08:09:52'),
(6, 1, 1, '2016-12-30 08:12:43'),
(6, 2, 1, '2016-12-30 08:12:54'),
(5, 2, 1, '2016-12-30 08:13:07'),
(6, 1, 1, '2016-12-30 08:13:16'),
(4, 2, 1, '2016-12-30 08:13:26'),
(6, 1, 1, '2016-12-30 09:12:59');

-- --------------------------------------------------------

--
-- Table structure for table `till`
--

CREATE TABLE IF NOT EXISTS `till` (
  `till_id` int(11) NOT NULL AUTO_INCREMENT,
  `till_key` varchar(255) DEFAULT NULL,
  `till_name` varchar(255) NOT NULL,
  `expiredate` date DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `product_Id` int(11) DEFAULT NULL,
  PRIMARY KEY (`till_id`),
  KEY `client_id` (`client_id`),
  KEY `branch_id` (`branch_id`),
  KEY `product_Id` (`product_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=27 ;

--
-- Dumping data for table `till`
--

INSERT INTO `till` (`till_id`, `till_key`, `till_name`, `expiredate`, `client_id`, `branch_id`, `product_Id`) VALUES
(1, 'key', '', '2016-12-08', 1, 1, 2),
(2, 'lksjdf', '', '2016-12-09', 8, 6, 1),
(3, 'gdfg', '', '2016-12-03', 8, 5, 1),
(4, 'ghgh', '', '2016-12-08', 8, 6, 3),
(5, 'ggfh', '', '2016-12-18', 8, 6, 3),
(6, 'dsfgsdf', '', '2017-01-28', 8, 5, 6),
(7, 'my key for this', '', '2018-07-08', 5, 7, 4),
(8, 'my key for this', '', '2018-07-08', 5, 7, 4),
(9, 'd', '', '0000-00-00', 5, 7, 4),
(10, 'da', '', '2018-07-08', 5, 7, 6),
(11, 'key for this till', '', '2018-07-08', 6, 8, 3),
(13, 'kl', '', '2016-12-07', NULL, 12, 3),
(14, 'mm', '', '2016-12-01', NULL, 12, 3),
(15, 'jk', '', '2016-11-30', 3, 14, 3),
(16, 'dlkf', '', '2016-12-08', NULL, 2, 2),
(17, 'aaaaaaaa', '', '2016-12-23', NULL, 2, 2),
(18, 'aaaaaaaaaaaa', '', '2016-12-23', 1, 2, 2),
(19, 'kyeu', '', '2016-12-31', 11, 16, 3),
(20, 'alkdjf', '', '2016-12-14', 1, 3, 4),
(21, 'adfjasd', '', '2016-12-23', 1, 2, 1),
(22, 'klds', '', '2016-12-24', 1, 1, 1),
(23, 'zzzzzzzzzzzzzzzz', '', '2016-12-09', 1, 1, 1),
(24, 'aaaaaaaaa', 'sdaf', '2016-12-01', 1, 1, 1),
(25, 'key', 'hj', '2016-12-20', 1, 2, 4),
(26, 'key', 'name', '2016-12-31', 2, 4, 2);

-- --------------------------------------------------------

--
-- Stand-in structure for view `till_history`
--
CREATE TABLE IF NOT EXISTS `till_history` (
`subject` varchar(14)
,`content` char(0)
,`type` varchar(8)
,`id` int(11)
,`client_id` int(11)
,`branchName` varchar(255)
,`productName` varchar(255)
,`expireDate` varchar(10)
,`loggedTimeStamp` timestamp
,`loggedDate` varchar(10)
,`loggedTime` time
);
-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `role` varchar(100) NOT NULL,
  `has_logged_in` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `role`, `has_logged_in`) VALUES
(1, 'cham', 'sha1$ec9c2592$1$76aa572f34a1a31c465f1ec7f53062e452b334da', 'OPERATOR', 1),
(1, 'cham', 'sha1$ec9c2592$1$76aa572f34a1a31c465f1ec7f53062e452b334da', 'OPERATOR', 1),
(0, 'test', '1234', 'OPERATOR', 0),
(2, 'test', '1234', 'OPERATOR', 0),
(14, 'CRM_CLIENT_USERNAME_14', 'sha1$cc5d7e2a$1$310b74c08f4f41299ad439b39b4021f1e6019f50', 'CLIENT', 0);

-- --------------------------------------------------------

--
-- Structure for view `client_blocked_history`
--
DROP TABLE IF EXISTS `client_blocked_history`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `client_blocked_history` AS select 'Client Blocked' AS `subject`,`block_unblock_client_note`.`note` AS `content`,'blocked' AS `type`,'' AS `id`,`block_unblock_client_note`.`client_id` AS `client_id`,'' AS `branchName`,'' AS `productName`,'' AS `expireDate`,`block_unblock_client_note`.`loggedTime` AS `loggedTimeStamp`,concat(cast(`block_unblock_client_note`.`loggedTime` as date),'') AS `loggedDate`,cast(`block_unblock_client_note`.`loggedTime` as time) AS `loggedTime` from `block_unblock_client_note` where (`block_unblock_client_note`.`blocked` = 1);

-- --------------------------------------------------------

--
-- Structure for view `client_branch_add_history`
--
DROP TABLE IF EXISTS `client_branch_add_history`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `client_branch_add_history` AS select concat('Branch ',`branch`.`name`,' Added') AS `subject`,`branch`.`name` AS `content`,'branch-added' AS `type`,`branch`.`branch_id` AS `id`,`client_branch_log`.`client_id` AS `client_id`,`branch`.`name` AS `branchName`,'' AS `productName`,'' AS `expireDate`,`client_branch_log`.`loggedTime` AS `loggedTimeStamp`,concat(cast(`client_branch_log`.`loggedTime` as date),'') AS `loggedDate`,cast(`client_branch_log`.`loggedTime` as time) AS `loggedTime` from (`client_branch_log` join `branch` on((`branch`.`branch_id` = `client_branch_log`.`branch_id`))) where (`client_branch_log`.`branch_added` = 1);

-- --------------------------------------------------------

--
-- Structure for view `client_branch_remove_history`
--
DROP TABLE IF EXISTS `client_branch_remove_history`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `client_branch_remove_history` AS select concat('Branch ',`branch`.`name`,' Removed') AS `subject`,`branch`.`name` AS `content`,'branch-removed' AS `type`,`branch`.`branch_id` AS `id`,`client_branch_log`.`client_id` AS `client_id`,`branch`.`name` AS `branchName`,'' AS `productName`,'' AS `expireDate`,`client_branch_log`.`loggedTime` AS `loggedTimeStamp`,concat(cast(`client_branch_log`.`loggedTime` as date),'') AS `loggedDate`,cast(`client_branch_log`.`loggedTime` as time) AS `loggedTime` from (`client_branch_log` join `branch` on((`branch`.`branch_id` = `client_branch_log`.`branch_id`))) where (`client_branch_log`.`branch_added` = 0);

-- --------------------------------------------------------

--
-- Structure for view `client_product_added_history`
--
DROP TABLE IF EXISTS `client_product_added_history`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `client_product_added_history` AS select concat('Product ',`products`.`name`,' Added') AS `subject`,`products`.`description` AS `content`,'product-added' AS `type`,`products`.`product_Id` AS `id`,`client_product_log`.`client_id` AS `client_id`,'' AS `branchName`,`products`.`name` AS `productName`,'' AS `expireDate`,`client_product_log`.`loggedTime` AS `loggedTimeStamp`,concat(cast(`client_product_log`.`loggedTime` as date),'') AS `loggedDate`,cast(`client_product_log`.`loggedTime` as time) AS `loggedTime` from (`client_product_log` join `products` on((`products`.`product_Id` = `client_product_log`.`product_id`))) where (`client_product_log`.`product_added` = 1);

-- --------------------------------------------------------

--
-- Structure for view `client_product_removed_history`
--
DROP TABLE IF EXISTS `client_product_removed_history`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `client_product_removed_history` AS select concat('Product ',`products`.`name`,' removed') AS `subject`,`products`.`description` AS `content`,'product-removed' AS `type`,`products`.`product_Id` AS `id`,`client_product_log`.`client_id` AS `client_id`,'' AS `branchName`,`products`.`name` AS `productName`,'' AS `expireDate`,`client_product_log`.`loggedTime` AS `loggedTimeStamp`,concat(cast(`client_product_log`.`loggedTime` as date),'') AS `loggedDate`,cast(`client_product_log`.`loggedTime` as time) AS `loggedTime` from (`client_product_log` join `products` on((`products`.`product_Id` = `client_product_log`.`product_id`))) where (`client_product_log`.`product_added` = 0);

-- --------------------------------------------------------

--
-- Structure for view `client_unblocked_history`
--
DROP TABLE IF EXISTS `client_unblocked_history`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `client_unblocked_history` AS select 'Client Unblocked' AS `subject`,`block_unblock_client_note`.`note` AS `content`,'unblocked' AS `type`,'' AS `id`,`block_unblock_client_note`.`client_id` AS `client_id`,'' AS `branchName`,'' AS `productName`,'' AS `expireDate`,`block_unblock_client_note`.`loggedTime` AS `loggedTimeStamp`,concat(cast(`block_unblock_client_note`.`loggedTime` as date),'') AS `loggedDate`,cast(`block_unblock_client_note`.`loggedTime` as time) AS `loggedTime` from `block_unblock_client_note` where (`block_unblock_client_note`.`blocked` = 0);

-- --------------------------------------------------------

--
-- Structure for view `note_history`
--
DROP TABLE IF EXISTS `note_history`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `note_history` AS select `client_note`.`subject` AS `subject`,`client_note`.`note` AS `content`,'note' AS `type`,'' AS `id`,`client_note`.`client_id` AS `client_id`,'' AS `branchName`,'' AS `productName`,'' AS `expireDate`,`client_note`.`loggedTime` AS `loggedTimeStamp`,concat(cast(`client_note`.`loggedTime` as date),'') AS `loggedDate`,cast(`client_note`.`loggedTime` as time) AS `loggedTime` from `client_note`;

-- --------------------------------------------------------

--
-- Structure for view `till_history`
--
DROP TABLE IF EXISTS `till_history`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `till_history` AS select 'new till added' AS `subject`,'' AS `content`,'till add' AS `type`,`till`.`till_id` AS `id`,`till`.`client_id` AS `client_id`,`branch`.`name` AS `branchName`,`products`.`name` AS `productName`,concat(cast(`till`.`expiredate` as date),'') AS `expireDate`,`client_till_log`.`loggedTime` AS `loggedTimeStamp`,concat(cast(`client_till_log`.`loggedTime` as date)) AS `loggedDate`,cast(`client_till_log`.`loggedTime` as time) AS `loggedTime` from (((`client_till_log` join `till` on((`till`.`till_id` = `client_till_log`.`till_id`))) join `branch` on((`branch`.`branch_id` = `till`.`branch_id`))) join `products` on((`products`.`product_Id` = `till`.`product_Id`)));

--
-- Constraints for dumped tables
--

--
-- Constraints for table `block_unblock_client_note`
--
ALTER TABLE `block_unblock_client_note`
  ADD CONSTRAINT `block_unblock_client_note_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`);

--
-- Constraints for table `branch`
--
ALTER TABLE `branch`
  ADD CONSTRAINT `branch_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`);

--
-- Constraints for table `call_record`
--
ALTER TABLE `call_record`
  ADD CONSTRAINT `call_record_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`);

--
-- Constraints for table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `client_ibfk_1` FOREIGN KEY (`stage_id`) REFERENCES `customer_stage` (`stage_id`);

--
-- Constraints for table `client_branch_log`
--
ALTER TABLE `client_branch_log`
  ADD CONSTRAINT `client_branch_log_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`),
  ADD CONSTRAINT `client_branch_log_ibfk_2` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`branch_id`);

--
-- Constraints for table `client_fax`
--
ALTER TABLE `client_fax`
  ADD CONSTRAINT `client_fax_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`);

--
-- Constraints for table `client_mail`
--
ALTER TABLE `client_mail`
  ADD CONSTRAINT `client_mail_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`);

--
-- Constraints for table `client_note`
--
ALTER TABLE `client_note`
  ADD CONSTRAINT `client_note_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`);

--
-- Constraints for table `client_phone`
--
ALTER TABLE `client_phone`
  ADD CONSTRAINT `client_phone_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`);

--
-- Constraints for table `client_product`
--
ALTER TABLE `client_product`
  ADD CONSTRAINT `client_product_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`),
  ADD CONSTRAINT `client_product_ibfk_2` FOREIGN KEY (`product_Id`) REFERENCES `products` (`product_Id`);

--
-- Constraints for table `client_product_log`
--
ALTER TABLE `client_product_log`
  ADD CONSTRAINT `client_product_log_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`),
  ADD CONSTRAINT `client_product_log_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_Id`);

--
-- Constraints for table `client_till_log`
--
ALTER TABLE `client_till_log`
  ADD CONSTRAINT `client_till_log_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`),
  ADD CONSTRAINT `client_till_log_ibfk_2` FOREIGN KEY (`till_id`) REFERENCES `till` (`till_id`);

--
-- Constraints for table `support_contract`
--
ALTER TABLE `support_contract`
  ADD CONSTRAINT `support_contract_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`);

--
-- Constraints for table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`swimlane_status_id`) REFERENCES `ticketswimlane` (`swimlane_id`),
  ADD CONSTRAINT `tickets_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`),
  ADD CONSTRAINT `tickets_ibfk_3` FOREIGN KEY (`problem_type_id`) REFERENCES `problem_types` (`problem_type_id`),
  ADD CONSTRAINT `tickets_ibfk_4` FOREIGN KEY (`priority_id`) REFERENCES `priorities` (`priority_id`),
  ADD CONSTRAINT `tickets_ibfk_5` FOREIGN KEY (`assignee_id`) REFERENCES `developers` (`developer_id`);

--
-- Constraints for table `ticket_swimlane_log`
--
ALTER TABLE `ticket_swimlane_log`
  ADD CONSTRAINT `ticket_swimlane_log_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`),
  ADD CONSTRAINT `ticket_swimlane_log_ibfk_2` FOREIGN KEY (`swimlane_status_id`) REFERENCES `ticketswimlane` (`swimlane_id`);

--
-- Constraints for table `till`
--
ALTER TABLE `till`
  ADD CONSTRAINT `till_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`),
  ADD CONSTRAINT `till_ibfk_2` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`branch_id`),
  ADD CONSTRAINT `till_ibfk_3` FOREIGN KEY (`product_Id`) REFERENCES `products` (`product_Id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
