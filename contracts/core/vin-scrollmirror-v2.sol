// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IVinScrollAvatar {
    function getAvatar(address agent) external view returns (string memory name, string memory title);
}

interface IVinScrollSentiment {
    function getSentiment(address agent) external view returns (string memory mood, int256 intensity);
}

interface IVinScrollOracleV2 {
    function getOmen(string calldata key) external view returns (
        string memory resolvedkey,
        string memory source,
        int256 value,
        uint256 timestamp
    );
}

contract VinScrollMirrorV2 {
    IVinScrollAvatar public avatar;
    IVinScrollSentiment public sentiment;
    IVinScrollOracleV2 public oracle;
    address public immutable mirrorKeeper;

    struct Reflection {
        string avatarName;
        string avatarTitle;
        string mood;
        int256 intensity;
        string omenKey;
        int256 omenValue;
        uint256 timestamp;
    }

    event ReflectionRevealed(address indexed agent, Reflection reflection);

    modifier onlyKeeper() {
        require(msg.sender == mirrorKeeper, "Not the mirror keeper");
        _;
    }

    constructor(address avatarAddr, address sentimentAddr, address oracleAddr) {
        avatar = IVinScrollAvatar(avatarAddr);
        sentiment = IVinScrollSentiment(sentimentAddr);
        oracle = IVinScrollOracleV2(oracleAddr);
        mirrorKeeper = msg.sender;
    }

    function reflect(address agent, string calldata omenKey) external view returns (Reflection memory) {
        (string memory name, string memory title) = avatar.getAvatar(agent);
        (string memory mood, int256 intensity) = sentiment.getSentiment(agent);
        (, , int256 omenValue,) = oracle.getOmen(omenKey);

        return Reflection({
            avatarName: name,
            avatarTitle: title,
            mood: mood,
            intensity: intensity,
            omenKey: omenKey,
            omenValue: omenValue,
            timestamp: block.timestamp
        });
    }

    function reveal(address agent, string calldata omenKey) external {
        Reflection memory r = this.reflect(agent, omenKey);
        emit ReflectionRevealed(agent, r);
    }
}
