pragma solidity ^0.8.0;

contract vinProjectRevelator {
    struct ProjectReport {
        string projectName;
        string region;
        uint256 declaredBudget;
        uint256 actualSpend;
        bool anomalyDetected;
        string remarks;
        uint256 timestamp;
    }

    ProjectReport[] public reports;

    event ProjectLogged(string projectName, bool anomalyDetected, uint256 indexed timestamp);

    function logProject(
        string memory _projectName,
        string memory _region,
        uint256 _declaredBudget,
        uint256 _actualSpend,
        string memory _remarks
    ) public {
        bool isAnomalous = _actualSpend > _declaredBudget || _actualSpend == 0;

        ProjectReport memory newReport = ProjectReport({
            projectName: _projectName,
            region: _region,
            declaredBudget: _declaredBudget,
            actualSpend: _actualSpend,
            anomalyDetected: isAnomalous,
            remarks: _remarks,
            timestamp: block.timestamp
        });

        reports.push(newReport);
        emit ProjectLogged(_projectName, isAnomalous, block.timestamp);
    }

    function getAllReports() public view returns (ProjectReport[] memory) {
        return reports;
    }

    function getAnomalies() public view returns (ProjectReport[] memory) {
        uint256 count = 0;
        for (uint256 i = 0; i < reports.length; i++) {
            if (reports[i].anomalyDetected) count++;
        }

        ProjectReport[] memory anomalies = new ProjectReport[](count);
        uint256 index = 0;

        for (uint256 i = 0; i < reports.length; i++) {
            if (reports[i].anomalyDetected) {
                anomalies[index] = reports[i];
                index++;
            }
        }

        return anomalies;
    }
}
