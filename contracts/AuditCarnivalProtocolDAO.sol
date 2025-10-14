// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AuditCarnivalProtocolDAO {
    address public admin;

    struct AuditEvent {
        string theme;
        string corridor;
        uint256 date;
        bool completed;
    }

    AuditEvent[] public events;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function scheduleAudit(string memory _theme, string memory _corridor, uint256 _date) external onlyAdmin {
        events.push(AuditEvent(_theme, _corridor, _date, false));
    }

    function markCompleted(uint256 index) external onlyAdmin {
        events[index].completed = true;
    }

    function getAudit(uint256 index) external view returns (AuditEvent memory) {
        return events[index];
    }
}
