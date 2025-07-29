// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract vinClusterReveal {
    address public deployer;
    uint256 public suspiciousThreshold = 10; // # of wallets with shared funding sources
    mapping(address => bool) public flaggedWallets;
    mapping(address => address[]) public fundingLinks;

    event WalletFlagged(address wallet);
    event ClusterDetected(address origin, address[] linkedWallets);

    constructor() {
        deployer = msg.sender;
    }

    function recordFunding(address origin, address target) external {
        require(msg.sender == deployer, "Only deployer can feed data");
        fundingLinks[origin].push(target);
        
        if (fundingLinks[origin].length >= suspiciousThreshold) {
            for (uint i = 0; i < fundingLinks[origin].length; i++) {
                flaggedWallets[fundingLinks[origin][i]] = true;
                emit WalletFlagged(fundingLinks[origin][i]);
            }
            emit ClusterDetected(origin, fundingLinks[origin]);
        }
    }

    function isFlagged(address wallet) external view returns (bool) {
        return flaggedWallets[wallet];
    }
}
