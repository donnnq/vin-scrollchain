contract BlessingAPRDashboard {
    address public steward = msg.sender;

    struct APRStatus {
        address ally;
        uint256 aprLevel;
        string lastUpdated;
    }

    APRStatus[] public dashboard;

    event APRLogged(address ally, uint256 aprLevel, string timestamp);

    function logAPR(address ally, uint256 aprLevel, string memory timestamp) public {
        dashboard.push(APRStatus(ally, aprLevel, timestamp));
        emit APRLogged(ally, aprLevel, timestamp);
    }
}
