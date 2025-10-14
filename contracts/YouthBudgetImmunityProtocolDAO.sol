// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract YouthBudgetImmunityProtocolDAO {
    address public admin;

    struct ImmunityEntry {
        string sector;
        string purokOrBarangay;
        uint256 protectedBudget;
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

    function submitProtocol(string memory _sector, string memory _purokOrBarangay, uint256 _protectedBudget, string memory _emotionalTag) external onlyAdmin {
        protocols.push(ImmunityEntry(_sector, _purokOrBarangay, _protectedBudget, _emotionalTag, false));
    }

    function enforceProtocol(uint256 index) external onlyAdmin {
        protocols[index].enforced = true;
    }

    function getProtocol(uint256 index) external view returns (ImmunityEntry memory) {
        return protocols[index];
    }
}
