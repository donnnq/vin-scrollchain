// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinFloodImpactLedger {
    struct ImpactReport {
        string projectName;
        string barangay;
        string residentFeedback;
        uint256 floodReductionPercent;
        bool feltByCommunity;
    }

    ImpactReport[] public reports;

    event ImpactLogged(string projectName, string barangay, bool feltByCommunity);

    function logImpact(
        string memory _projectName,
        string memory _barangay,
        string memory _residentFeedback,
        uint256 _floodReductionPercent,
        bool _feltByCommunity
    ) public {
        reports.push(ImpactReport(_projectName, _barangay, _residentFeedback, _floodReductionPercent, _feltByCommunity));
        emit ImpactLogged(_projectName, _barangay, _feltByCommunity);
    }

    function getImpact(uint256 index) public view returns (ImpactReport memory) {
        return reports[index];
    }
}
