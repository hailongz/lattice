<?php

/**
 * 账号
 */
if($library){
	
	define("LADB","ladb");
	
	require_once "$library/org.hailong.configs/error_code.php";
	require_once "$library/org.hailong.service/service.php";
	require_once "$library/org.hailong.ui/ui.php";
	
	require_once "$library/com.9vteam.lattice/db/LALatticeBeacon.php";
	
	require_once "$library/com.9vteam.lattice/tasks/LATask.php";
	require_once "$library/com.9vteam.lattice/tasks/LALatticeBeaconTask.php";
	require_once "$library/com.9vteam.lattice/tasks/LALatticeBeaconQueryTask.php";
	
	require_once "$library/com.9vteam.lattice/services/LALatticeService.php";
}
?>