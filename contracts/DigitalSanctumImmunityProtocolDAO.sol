// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DigitalSanctumImmunityProtocolDAO {
    address public admin;

    struct ImmunityEntry {
        string systemName;
        string threatVector;
        string immunityClause;
        string emotionalTag;
        bool enforced;
    }

    ImmunityEntry[] public protocols;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitProtocol(string memory _systemName, string memory _threatVector, string memory _immunityClause, string memory _emotionalTag) external onlyAdmin {
        protocols.push(ImmunityEntry(_systemName, _threatVector, _immunityClause, _emotionalTag, false));
    }

    function enforceProtocol(uint256 index) external onlyAdmin {
        protocols[index].enforced = true;
    }

    function getProtocol(uint256 index) external view returns (ImmunityEntry memory) {
        return protocols[index];
    }
}
