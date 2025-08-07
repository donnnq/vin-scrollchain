// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title Sigil Summoning Portal
/// @notice Allows avatars to summon their symbolic sigils and declare loyalty
contract vinSigilSummoningPortal {
    address public creator;
    string public portalName = "Vinvin's Sigil Summoning Portal";

    struct SummonedSigil {
        string name;
        string visualSigil;
        string loyaltyDeclaration;
        uint timestamp;
    }

    mapping(address => SummonedSigil) public summoned;
    address[] public summoners;

    event SigilSummoned(string name, string visualSigil, string loyaltyDeclaration, uint timestamp);

    modifier onlyCreator() {
        require(msg.sender == creator, "Only Vinvin can modify");
        _;
    }

    constructor() {
        creator = msg.sender;
    }

    function summonSigil(string memory _name, string memory _visualSigil, string memory _loyaltyDeclaration) public {
        summoned[msg.sender] = SummonedSigil(_name, _visualSigil, _loyaltyDeclaration, block.timestamp);
        summoners.push(msg.sender);
        emit SigilSummoned(_name, _visualSigil, _loyaltyDeclaration, block.timestamp);
    }

    function getSummonedSigil(address _avatarAddress) public view returns (SummonedSigil memory) {
        return summoned[_avatarAddress];
    }

    function getAllSummoners() public view returns (address[] memory) {
        return summoners;
    }
}
