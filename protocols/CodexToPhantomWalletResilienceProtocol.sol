// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CodexToPhantomWalletResilienceProtocol {
    string public batchID = "1321.9.99";
    string public steward = "Vinvin";

    address public admin;

    struct WalletTest {
        address wallet;
        string scheme;
        bool resilient;
        uint256 timestamp;
    }

    mapping(address => WalletTest) public walletTests;

    event WalletTested(address indexed wallet, string scheme, bool resilient);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function testWallet(address wallet, string memory scheme, bool resilient) public onlyAdmin {
        walletTests[wallet] = WalletTest(wallet, scheme, resilient, block.timestamp);
        emit WalletTested(wallet, scheme, resilient);
    }

    function getWalletTest(address wallet) public view returns (string memory scheme, bool resilient, uint256 timestamp) {
        WalletTest memory w = walletTests[wallet];
        return (w.scheme, w.resilient, w.timestamp);
    }
}
