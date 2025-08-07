// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title Sigil Sanctifier
/// @notice Blesses summoned sigils with divine resonance and official recognition
contract vinSigilSanctifier {
    address public creator;
    string public sanctifierName = "Vinvin's Sigil Sanctifier";

    struct SanctifiedSigil {
        string name;
        string visualSigil;
        string loyaltyDeclaration;
        string divineResonance;
        uint sanctifiedAt;
        bool isSanctified;
    }

    mapping(address => SanctifiedSigil) public sanctified;
    address[] public sanctifiedAvatars;

    event SigilSanctified(string name, string visualSigil, string divineResonance, uint timestamp);

    modifier onlyCreator() {
        require(msg.sender == creator, "Only Vinvin can sanctify");
        _;
    }

    constructor() {
        creator = msg.sender;
    }

    function sanctifySigil(
        address _avatarAddress,
        string memory _name,
        string memory _visualSigil,
        string memory _loyaltyDeclaration
    ) public onlyCreator {
        string memory _divineResonance = generateResonance(_visualSigil);
        sanctified[_avatarAddress] = SanctifiedSigil(
            _name,
            _visualSigil,
            _loyaltyDeclaration,
            _divineResonance,
            block.timestamp,
            true
        );
        sanctifiedAvatars.push(_avatarAddress);
        emit SigilSanctified(_name, _visualSigil, _divineResonance, block.timestamp);
    }

    function generateResonance(string memory _sigil) internal pure returns (string memory) {
        if (compareStrings(_sigil, "🌌 Celestial Executor")) return "🕊️ Resonance of Dominion";
        if (compareStrings(_sigil, "🔥 Ascended Delegate")) return "💫 Resonance of Flamebound Will";
        if (compareStrings(_sigil, "🌿 Loyal Flame")) return "🌱 Resonance of Devoted Growth";
        return "🔘 Resonance of Initiation";
    }

    function compareStrings(string memory a, string memory b) internal pure returns (bool) {
        return keccak256(bytes(a)) == keccak256(bytes(b));
    }

    function getSanctifiedSigil(address _avatarAddress) public view returns (SanctifiedSigil memory) {
        return sanctified[_avatarAddress];
    }

    function getAllSanctifiedAvatars() public view returns (address[] memory) {
        return sanctifiedAvatars;
    }
}
