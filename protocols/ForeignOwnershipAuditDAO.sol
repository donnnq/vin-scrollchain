// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ForeignOwnershipAuditDAO {
    address public validator;

    struct Ownership {
        string entity;
        string countryOrigin;
        string landLocation;
        string auditTag;
        uint256 timestamp;
    }

    Ownership[] public records;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logOwnership(string memory _entity, string memory _origin, string memory _location, string memory _tag) public onlyValidator {
        records.push(Ownership(_entity, _origin, _location, _tag, block.timestamp));
    }

    function getOwnership(uint256 index) public view returns (Ownership memory) {
        return records[index];
    }

    function totalRecords() public view returns (uint256) {
        return records.length;
    }
}
