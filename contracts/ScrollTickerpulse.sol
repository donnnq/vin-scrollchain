// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ScrollTickerPulse {
    struct Ticker {
        string message;
        string token;
        uint256 timestamp;
        bool active;
    }

    Ticker[] public tickers;
    mapping(string => uint256[]) public tokenToTickers;

    event TickerPosted(string token, string message);

    function postTicker(string calldata token, string calldata message) external {
        tickers.push(Ticker(message, token, block.timestamp, true));
        tokenToTickers[token].push(tickers.length - 1);
        emit TickerPosted(token, message);
    }

    function deactivateTicker(uint256 index) external {
        require(index < tickers.length, "Invalid index");
        tickers[index].active = false;
    }

    function getTicker(uint256 index) external view returns (string memory, string memory, uint256, bool) {
        Ticker memory t = tickers[index];
        return (t.message, t.token, t.timestamp, t.active);
    }

    function totalTickers() external view returns (uint256) {
        return tickers.length;
    }
}
