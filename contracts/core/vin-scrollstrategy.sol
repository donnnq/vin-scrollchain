// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VinScrollStrategy {
    struct Strategy {
        string name;
        string intent;
        string sentimentTarget;
        uint256 uses;
    }

    Strategy[] public strategies;
    address public immutable tactician;

    event StrategyAdded(uint256 indexed id, string name, string intent, string sentimentTarget);
    event StrategyInvoked(uint256 indexed id, address indexed by, string outcome, uint256 timestamp);

    modifier onlyTactician() {
        require(msg.sender == tactician, "Not the tactician");
        _;
    }

    constructor() {
        tactician = msg.sender;
    }

    function addStrategy(string calldata name, string calldata intent, string calldata sentimentTarget) external onlyTactician {
        strategies.push(Strategy({
            name: name,
            intent: intent,
            sentimentTarget: sentimentTarget,
            uses: 0
        }));

        emit StrategyAdded(strategies.length - 1, name, intent, sentimentTarget);
    }

    function invokeStrategy(uint256 id, string calldata outcome) external onlyTactician {
        require(id < strategies.length, "Invalid strategy");
        strategies[id].uses += 1;
        emit StrategyInvoked(id, msg.sender, outcome, block.timestamp);
    }

    function getStrategy(uint256 id) external view returns (Strategy memory) {
        require(id < strategies.length, "Invalid strategy");
        return strategies[id];
    }

    function totalStrategies() external view returns (uint256) {
        return strategies.length;
    }
}
