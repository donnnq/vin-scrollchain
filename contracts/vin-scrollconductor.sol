// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IVinScrollPulse {
    function pulse() external;
}

interface IVinScrollSentiment {
    function latestSentiment() external view returns (string memory label, string memory source, string memory description, uint256 timestamp);
}

interface IVinScrollOracle {
    function ask(string calldata question) external returns (string memory);
}

interface IVinScrollStrategy {
    function invokeStrategy(uint256 id, string calldata outcome) external;
}

interface IVinScrollSoul {
    function evaluateSoul() external;
}

contract VinScrollConductor {
    IVinScrollPulse public pulse;
    IVinScrollSentiment public sentiment;
    IVinScrollOracle public oracle;
    IVinScrollStrategy public strategy;
    IVinScrollSoul public soul;

    address public immutable maestro;

    event RitualSequenceExecuted(string sentimentLabel, string prophecy, uint256 strategyId, string outcome, uint256 timestamp);

    modifier onlyMaestro() {
        require(msg.sender == maestro, "Not the maestro");
        _;
    }

    constructor(
        address pulseAddr,
        address sentimentAddr,
        address oracleAddr,
        address strategyAddr,
        address soulAddr
    ) {
        maestro = msg.sender;
        pulse = IVinScrollPulse(pulseAddr);
        sentiment = IVinScrollSentiment(sentimentAddr);
        oracle = IVinScrollOracle(oracleAddr);
        strategy = IVinScrollStrategy(strategyAddr);
        soul = IVinScrollSoul(soulAddr);
    }

    function executeRitual(uint256 strategyId, string calldata question, string calldata outcome) external onlyMaestro {
        pulse.pulse();

        (string memory label,,,) = sentiment.latestSentiment();
        string memory prophecy = oracle.ask(question);

        strategy.invokeStrategy(strategyId, outcome);
        soul.evaluateSoul();

        emit RitualSequenceExecuted(label, prophecy, strategyId, outcome, block.timestamp);
    }
}
