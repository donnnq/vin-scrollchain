// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinDecentralizedPressProtocol {
    address public scrollkeeper;

    struct NewsNode {
        string country;
        string outletName;
        string primaryLanguage;
        bool isVerified;
        uint256 timestamp;
    }

    NewsNode[] public pressNodes;

    event NodeRegistered(string country, string outletName);
    event NodeVerified(string outletName);

    modifier onlyScrollkeeper() {
        require(msg.sender == scrollkeeper, "Not authorized");
        _;
    }

    constructor() {
        scrollkeeper = msg.sender;
    }

    function registerNode(string memory country, string memory outletName, string memory primaryLanguage) external onlyScrollkeeper {
        pressNodes.push(NewsNode(country, outletName, primaryLanguage, false, block.timestamp));
        emit NodeRegistered(country, outletName);
    }

    function verifyNode(uint256 index) external onlyScrollkeeper {
        pressNodes[index].isVerified = true;
        emit NodeVerified(pressNodes[index].outletName);
    }

    function getNode(uint256 index) external view returns (string memory, string memory, string memory, bool, uint256) {
        NewsNode memory n = pressNodes[index];
        return (n.country, n.outletName, n.primaryLanguage, n.isVerified, n.timestamp);
    }

    function totalNodes() external view returns (uint256) {
        return pressNodes.length;
    }
}
