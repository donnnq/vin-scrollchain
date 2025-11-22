// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CodexToQuantumSafeSignatureProtocol {
    string public batchID = "1321.9.97";
    string public steward = "Vinvin";

    address public admin;

    struct SignatureScheme {
        string name;
        bool quantumSafe;
        bool codified;
    }

    mapping(string => SignatureScheme) public schemeRegistry;

    event SchemeCodified(string name, bool quantumSafe);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function codifyScheme(string memory name, bool quantumSafe) public onlyAdmin {
        schemeRegistry[name] = SignatureScheme(name, quantumSafe, true);
        emit SchemeCodified(name, quantumSafe);
    }

    function isQuantumSafe(string memory name) public view returns (bool) {
        return schemeRegistry[name].quantumSafe;
    }
}
