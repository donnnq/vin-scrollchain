// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinBarangaySurveyor {
    struct SurveyEntry {
        address citizen;
        string status;
        string aidRequest;
        uint256 timestamp;
    }

    SurveyEntry[] public entries;
    event SurveyLogged(address indexed citizen, string status, string aidRequest);

    function logSurvey(address citizen, string calldata status, string calldata aidRequest) external {
        entries.push(SurveyEntry(citizen, status, aidRequest, block.timestamp));
        emit SurveyLogged(citizen, status, aidRequest);
    }

    function getAllEntries() external view returns (SurveyEntry[] memory) {
        return entries;
    }
}
