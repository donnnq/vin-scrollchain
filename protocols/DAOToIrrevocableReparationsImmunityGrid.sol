// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DAOToIrrevocableReparationsImmunityGrid {
    string public batchID = "1321.9.105";
    string public steward = "Vinvin";

    address public admin;

    struct ImmunityClause {
        bytes32 assetKey;
        string origin;
        bool irrevocable;
        uint256 timestamp;
    }

    mapping(bytes32 => ImmunityClause) public immunityRegistry;

    event ImmunitySealed(bytes32 indexed assetKey, string origin, bool irrevocable);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function sealImmunity(bytes32 assetKey, string memory origin) public onlyAdmin {
        immunityRegistry[assetKey] = ImmunityClause(assetKey, origin, true, block.timestamp);
        emit ImmunitySealed(assetKey, origin, true);
    }

    function getImmunity(bytes32 assetKey) public view returns (string memory origin, bool irrevocable, uint256 timestamp) {
        ImmunityClause memory i = immunityRegistry[assetKey];
        return (i.origin, i.irrevocable, i.timestamp);
    }
}
