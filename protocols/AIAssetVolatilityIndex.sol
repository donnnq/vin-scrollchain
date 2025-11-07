// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AIAssetVolatilityIndex {
    address public steward;

    struct VolatilityEntry {
        string token;
        uint256 priceChangePercent;
        uint256 volumeChangePercent;
        string timestamp;
        string emotionalTag;
    }

    VolatilityEntry[] public index;

    event VolatilityLogged(string token, uint256 priceChangePercent, uint256 volumeChangePercent, string timestamp, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logVolatility(
        string memory token,
        uint256 priceChangePercent,
        uint256 volumeChangePercent,
        string memory timestamp,
        string memory emotionalTag
    ) public onlySteward {
        index.push(VolatilityEntry(token, priceChangePercent, volumeChangePercent, timestamp, emotionalTag));
        emit VolatilityLogged(token, priceChangePercent, volumeChangePercent, timestamp, emotionalTag);
    }
}
