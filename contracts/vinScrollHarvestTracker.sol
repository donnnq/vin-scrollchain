pragma solidity ^0.8.18;

contract vinScrollHarvestTracker {
    struct HarvestReport {
        string region;
        uint256 rainfall;
        uint256 temperature;
        uint256 yieldEstimate;
        uint256 timestamp;
    }

    HarvestReport[] public reports;

    event ReportSubmitted(string region, uint256 yieldEstimate);

    function submitReport(
        string memory _region,
        uint256 _rainfall,
        uint256 _temperature,
        uint256 _yieldEstimate
    ) external {
        reports.push(HarvestReport(_region, _rainfall, _temperature, _yieldEstimate, block.timestamp));
        emit ReportSubmitted(_region, _yieldEstimate);
    }

    function getLatestReport() external view returns (HarvestReport memory) {
        return reports[reports.length - 1];
    }
}
