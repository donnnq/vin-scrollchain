// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ChinaRiskContainmentCodex {
    address public admin;

    struct ContainmentEntry {
        string riskTheme;
        string containmentAction;
        string emotionalTag;
        bool deployed;
        bool enforced;
    }

    ContainmentEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function deployContainment(string memory riskTheme, string memory containmentAction, string memory emotionalTag) external onlyAdmin {
        entries.push(ContainmentEntry(riskTheme, containmentAction, emotionalTag, true, false));
    }

    function enforceContainment(uint256 index) external onlyAdmin {
        entries[index].enforced = true;
    }

    function getContainmentEntry(uint256 index) external view returns (ContainmentEntry memory) {
        return entries[index];
    }
}
