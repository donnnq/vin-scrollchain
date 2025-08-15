// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title TelcoAuditDeck
/// @notice Tracks abusive billing, poor service, and civic violations by telcos
contract TelcoAuditDeck {
    struct TelcoReport {
        string telcoName;
        string violation;
        uint256 timestamp;
        string citizenVoice;
    }

    TelcoReport[] public reports;

    event TelcoReported(string telcoName, string violation, string citizenVoice);

    function reportTelco(
        string memory _telcoName,
        string memory _violation,
        string memory _citizenVoice
    ) public {
        reports.push(TelcoReport({
            telcoName: _telcoName,
            violation: _violation,
            timestamp: block.timestamp,
            citizenVoice: _citizenVoice
        }));

        emit TelcoReported(_telcoName, _violation, _citizenVoice);
    }

    function getReport(uint256 index) public view returns (TelcoReport memory) {
        require(index < reports.length, "Invalid index");
        return reports[index];
    }

    function totalReports() public view returns (uint256) {
        return reports.length;
    }
}
