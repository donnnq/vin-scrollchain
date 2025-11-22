// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CodexToResilienceHardeningProtocol {
    string public batchID = "1321.9.100";
    string public steward = "Vinvin";

    address public admin;

    struct Hardening {
        string scheme;
        string upgrade;
        uint256 timestamp;
    }

    mapping(string => Hardening) public hardeningRegistry;

    event SchemeHardened(string scheme, string upgrade);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function hardenScheme(string memory scheme, string memory upgrade) public onlyAdmin {
        hardeningRegistry[scheme] = Hardening(scheme, upgrade, block.timestamp);
        emit SchemeHardened(scheme, upgrade);
    }

    function getHardening(string memory scheme) public view returns (string memory upgrade, uint256 timestamp) {
        Hardening memory h = hardeningRegistry[scheme];
        return (h.upgrade, h.timestamp);
    }
}
