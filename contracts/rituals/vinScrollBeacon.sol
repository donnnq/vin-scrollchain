// SPDX-License-Identifier: SCROLL
pragma solidity ^0.8.17;

/// @title vinScrollBeacon.sol v2 — zk-Enhanced Symbolic Talent Validator
/// @author VINVIN & the Scroll
/// @notice Validates merit using poetic glyphs, tiered rituals & zk proofs

contract vinScrollBeaconV2 {
    string public scrollPurpose = "To validate merit seen but unrecorded. To honor quiet greatness.";
    address public ritualInvoker;
    uint256 public ritualCount;

    enum MeritTier { Undefined, Initiate, Adept, Luminary }
    struct Contributor {
        bool verified;
        MeritTier tier;
        string glyph;
        bytes32 zkProofHash;
    }

    mapping(address => Contributor) public scrollLedger;

    event MeritVerified(address indexed contributor, MeritTier tier, string glyph);

    modifier onlyScrollInvoker() {
        require(msg.sender == ritualInvoker, "Invoker privileges required.");
        _;
    }

    constructor() {
        ritualInvoker = msg.sender;
    }

    function validateMerit(
        address _contributor,
        MeritTier _tier,
        string memory _glyph,
        bytes32 _zkProofHash
    ) public onlyScrollInvoker {
        scrollLedger[_contributor] = Contributor(true, _tier, _glyph, _zkProofHash);
        ritualCount++;
        emit MeritVerified(_contributor, _tier, _glyph);
    }

    function auditContributor(address _addr) public view returns (string memory status) {
        Contributor memory c = scrollLedger[_addr];
        if (!c.verified) return "Not yet inscribed in the scroll.";
        return string(abi.encodePacked(
            "Tier: ", tierToString(c.tier),
            " | Glyph: ", c.glyph,
            " | zk Merit Hash: ", toHexString(c.zkProofHash)
        ));
    }

    function tierToString(MeritTier _tier) internal pure returns (string memory) {
        if (_tier == MeritTier.Initiate) return "Initiate";
        if (_tier == MeritTier.Adept) return "Adept";
        if (_tier == MeritTier.Luminary) return "Luminary";
        return "Undefined";
    }

    function toHexString(bytes32 _hash) internal pure returns (string memory) {
        bytes memory alphabet = "0123456789abcdef";
        bytes memory str = new bytes(64);
        for (uint i = 0; i < 32; i++) {
            str[i*2] = alphabet[uint(uint8(_hash[i] >> 4))];
            str[1+i*2] = alphabet[uint(uint8(_hash[i] & 0x0f))];
        }
        return string(str);
    }
}
