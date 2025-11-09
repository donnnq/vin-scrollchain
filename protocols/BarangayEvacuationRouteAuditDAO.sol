// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract BarangayEvacuationRouteAuditDAO {
    address public validator;

    struct RouteAudit {
        string barangay;
        string routeDescription;
        string status;
        uint256 timestamp;
    }

    RouteAudit[] public audits;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function submitAudit(string memory _barangay, string memory _routeDescription, string memory _status) public onlyValidator {
        audits.push(RouteAudit(_barangay, _routeDescription, _status, block.timestamp));
    }

    function getAudit(uint256 index) public view returns (RouteAudit memory) {
        return audits[index];
    }

    function totalAudits() public view returns (uint256) {
        return audits.length;
    }
}
