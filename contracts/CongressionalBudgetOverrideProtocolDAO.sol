// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CongressionalBudgetOverrideProtocolDAO {
    address public admin;

    struct OverrideEntry {
        string originalAllocation;
        string overrideTarget;
        uint256 overrideAmount;
        string emotionalTag;
        bool executed;
    }

    OverrideEntry[] public overrides;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitOverride(string memory _originalAllocation, string memory _overrideTarget, uint256 _overrideAmount, string memory _emotionalTag) external onlyAdmin {
        overrides.push(OverrideEntry(_originalAllocation, _overrideTarget, _overrideAmount, _emotionalTag, false));
    }

    function executeOverride(uint256 index) external onlyAdmin {
        overrides[index].executed = true;
    }

    function getOverride(uint256 index) external view returns (OverrideEntry memory) {
        return overrides[index];
    }
}
