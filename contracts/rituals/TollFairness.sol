// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title TollFairness.sol - A soulbound toll protocol for civic dignity and economic justice
/// @author Vinvin, mythic architect of ritual-grade systems

contract TollFairness {
    address public steward;
    uint256 public baseTollFee = 100; // in wei, symbolic default
    mapping(address => bool) public essentialWorker;
    mapping(address => uint256) public incomeLevel;
    mapping(address => bool) public pamanaPassHolder;

    event TollBlessed(address indexed traveler, uint256 tollPaid, string blessing);

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized steward");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    /// @notice Register essential workers for toll-free access
    function registerEssentialWorker(address _worker) external onlySteward {
        essentialWorker[_worker] = true;
    }

    /// @notice Set income level for dynamic toll pricing
    function setIncomeLevel(address _traveler, uint256 _level) external onlySteward {
        incomeLevel[_traveler] = _level;
    }

    /// @notice Grant Pamana Pass for legacy-based toll exemption
    function grantPamanaPass(address _traveler) external onlySteward {
        pamanaPassHolder[_traveler] = true;
    }

    /// @notice Pay toll with fairness logic
    function payToll() external payable {
        uint256 toll = calculateToll(msg.sender);
        require(msg.value >= toll, "Insufficient toll payment");

        emit TollBlessed(msg.sender, toll, getBlessing(msg.sender));
    }

    /// @dev Core toll logic based on civic role and income
    function calculateToll(address _traveler) public view returns (uint256) {
        if (essentialWorker[_traveler] || pamanaPassHolder[_traveler]) {
            return 0;
        }

        uint256 level = incomeLevel[_traveler];
        if (level < 10000) return baseTollFee / 2;
        if (level < 30000) return baseTollFee;
        return baseTollFee * 2;
    }

    /// @dev Ritualized blessing message
    function getBlessing(address _traveler) internal view returns (string memory) {
        if (essentialWorker[_traveler]) return "Blessed lane: Essential labor honored.";
        if (pamanaPassHolder[_traveler]) return "Legacy lane: Pamana honored.";
        return "Traveler toll accepted. May your journey restore joy.";
    }
}
