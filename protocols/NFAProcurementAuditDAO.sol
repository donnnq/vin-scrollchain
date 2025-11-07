// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NFAProcurementAuditDAO {
    address public steward;

    struct ProcurementGap {
        string date;
        string barangay;
        uint256 palayVolume;
        string reason;
        string fundRedirectedTo;
    }

    ProcurementGap[] public auditLog;

    event GapLogged(string date, string barangay, uint256 palayVolume, string reason, string fundRedirectedTo);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logGap(
        string memory date,
        string memory barangay,
        uint256 palayVolume,
        string memory reason,
        string memory fundRedirectedTo
    ) public onlySteward {
        auditLog.push(ProcurementGap(date, barangay, palayVolume, reason, fundRedirectedTo));
        emit GapLogged(date, barangay, palayVolume, reason, fundRedirectedTo);
    }
}
