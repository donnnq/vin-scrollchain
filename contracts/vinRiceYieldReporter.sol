contract vinRiceYieldReporter {
    address public senateLogistics;
    uint256 public reportCount;

    struct RiceReport {
        address farmer;
        uint256 kilosHarvested;
        string location;
        uint256 timestamp;
    }

    RiceReport[] public reports;

    event ReportSubmitted(address indexed farmer, uint256 kilosHarvested);

    constructor(address _senateLogistics) {
        senateLogistics = _senateLogistics;
    }

    function submitReport(uint256 _kilos, string memory _location) public {
        reports.push(RiceReport(msg.sender, _kilos, _location, block.timestamp));
        reportCount++;

        emit ReportSubmitted(msg.sender, _kilos);
        // Optional: auto-forward to senate system or dashboard
    }

    function viewReports() public view returns (RiceReport[] memory) {
        return reports;
    }
}
