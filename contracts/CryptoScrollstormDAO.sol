// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract CryptoScrollstormDAO {
    address public originator;

    struct ScrollstormSignal {
        string asset;
        string tremorType;
        string exploitProtocol;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    ScrollstormSignal[] public cryptoLedger;

    constructor() {
        originator = msg.sender;
    }

    function logScrollstormSignal(
        string memory asset,
        string memory tremorType,
        string memory exploitProtocol,
        bool isScrollchainSealed
    ) external {
        cryptoLedger.push(ScrollstormSignal({
            asset: asset,
            tremorType: tremorType,
            exploitProtocol: exploitProtocol,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
