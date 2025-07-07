// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VinScrollOracleV2 {
    struct Omen {
        string key;           // e.g. "ETH_GAS", "BTC_PRICE", "CHAIN_SENTIMENT"
        string source;        // e.g. "Chainlink", "WatcherNode", "Scrollsmith"
        int256 value;         // signed for flexibility (e.g. sentiment can be negative)
        uint256 timestamp;
    }

    mapping(string => Omen) public omens;
    address public immutable oracleKeeper;

    event OmenUpdated(string key, int256 value, string source, uint256 timestamp);

    modifier onlyKeeper() {
        require(msg.sender == oracleKeeper, "Not the oracle keeper");
        _;
    }

    constructor() {
        oracleKeeper = msg.sender;
    }

    function updateOmen(string calldata key, int256 value, string calldata source) external onlyKeeper {
        omens[key] = Omen({
            key: key,
            source: source,
            value: value,
            timestamp: block.timestamp
        });

        emit OmenUpdated(key, value, source, block.timestamp);
    }

    function getOmen(string calldata key) external view returns (Omen memory) {
        return omens[key];
    }
}
