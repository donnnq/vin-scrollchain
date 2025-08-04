// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract vinScrollSigil {
    struct Sigil {
        address bearer;
        string publicDeclaration;
        bool conflictCleared;
        uint256 timestamp;
    }

    mapping(address => Sigil) public sigilVault;
    address public sigilMaster;

    event SigilMinted(address indexed bearer, string declaration);
    event SigilRevoked(address indexed bearer);

    modifier onlyMaster() {
        require(msg.sender == sigilMaster, "Not authorized");
        _;
    }

    constructor() {
        sigilMaster = msg.sender;
    }

    function mintSigil(address _wallet, string calldata _declaration, bool _cleared) external onlyMaster {
        require(_cleared, "Conflict must be cleared");
        sigilVault[_wallet] = Sigil(_wallet, _declaration, _cleared, block.timestamp);
        emit SigilMinted(_wallet, _declaration);
    }

    function revokeSigil(address _wallet) external onlyMaster {
        delete sigilVault[_wallet];
        emit SigilRevoked(_wallet);
    }

    function viewSigil(address _wallet) external view returns (Sigil memory) {
        return sigilVault[_wallet];
    }
}
