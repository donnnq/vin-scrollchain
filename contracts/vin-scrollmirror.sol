// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IVinScrollSoul {
    function currentEssence() external view returns (string memory);
}

interface IVinScrollSentiment {
    function latestSentiment() external view returns (string memory label, string memory source, string memory description, uint256 timestamp);
}

interface IVinScrollOracle {
    function ask(string calldata question) external returns (string memory);
}

contract VinScrollMirror {
    IVinScrollSoul public soul;
    IVinScrollSentiment public sentiment;
    IVinScrollOracle public oracle;

    address public immutable mirrorkeeper;
    string public lastReflection;

    event MirrorReflected(string essence, string sentiment, string prophecy, uint256 timestamp);

    modifier onlyMirrorkeeper() {
        require(msg.sender == mirrorkeeper, "Not the mirrorkeeper");
        _;
    }

    constructor(address soulAddr, address sentimentAddr, address oracleAddr) {
        mirrorkeeper = msg.sender;
        soul = IVinScrollSoul(soulAddr);
        sentiment = IVinScrollSentiment(sentimentAddr);
        oracle = IVinScrollOracle(oracleAddr);
    }

    function reflect(string calldata question) external onlyMirrorkeeper returns (string memory) {
        string memory essence = soul.currentEssence();
        (string memory mood,,,) = sentiment.latestSentiment();
        string memory prophecy = oracle.ask(question);

        lastReflection = string(abi.encodePacked(
            "Essence: ", essence,
            " | Sentiment: ", mood,
            " | Prophecy: ", prophecy
        ));

        emit MirrorReflected(essence, mood, prophecy, block.timestamp);
        return lastReflection;
    }

    function getLastReflection() external view returns (string memory) {
        return lastReflection;
    }
}
