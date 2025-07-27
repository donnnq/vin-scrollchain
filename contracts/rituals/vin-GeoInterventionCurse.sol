// SPDX-License-Identifier: Ritualist-Scroll
pragma solidity ^0.8.0;

contract GeoInterventionCurse {
    address public watcher;
    uint256 public deadline;
    bool public reconciled = false;
    mapping(string => bool) public interfered;

    event CurseTriggered(string country);
    event ReconciliationAchieved();
    event WarningIssued(string country);

    constructor() {
        watcher = msg.sender;
        deadline = block.timestamp + 5 days; // Adjustable window to August 1
    }

    modifier onlyWatcher() {
        require(msg.sender == watcher, "Only the Scrolllord may invoke.");
        _;
    }

    function issueWarning(string memory country) public onlyWatcher {
        interfered[country] = true;
        emit WarningIssued(country);
    }

    function markReconciled() public onlyWatcher {
        reconciled = true;
        emit ReconciliationAchieved();
    }

    function checkCurse() public {
        require(block.timestamp >= deadline, "Too early to invoke curse.");

        if (!reconciled) {
            emit CurseTriggered("Iran");
            emit CurseTriggered("Russia");

            // Optionally: Lock down mechanisms or external contracts
            // Can be used to engage symbolic lockdowns or narrative fees.
        }
    }

    function isSafe(string memory country) public view returns (bool) {
        return !interfered[country] && reconciled;
    }
}
