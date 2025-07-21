// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title vinHumanRightsProtocol
/// @notice Embeds digital human rights into Web3: self-custody SBTs, personhood, privacy-by-default
/// @author VINVIN
contract vinHumanRightsProtocol {
    // —— Events ——
    event SovereignMint(address indexed soulbound, uint256 indexed id, uint256 blockHeight);
    event IdentityVerified(address indexed personhood, bool verified);
    event PrivacyShieldActivated(address indexed user);
    event PrivacyShieldRevoked(address indexed user);
    event AdminTransferred(address indexed oldAdmin, address indexed newAdmin);

    // —— State ——
    address public admin;
    uint256 public totalSoulbound;

    // Each address can be “human-verified” and then minted a unique soulbound token (SBT).
    mapping(address => bool) public verifiedPersonhood;
    mapping(address => uint256) public soulboundId;

    // Privacy shield flag: when true, user opts into maximal privacy defaults.
    mapping(address => bool) public privacyShield;

    // —— Modifiers ——
    modifier onlyAdmin() {
        require(msg.sender == admin, "HRP: caller is not admin");
        _;
    }

    modifier onlyHuman(address user) {
        require(verifiedPersonhood[user], "HRP: not a verified person");
        _;
    }

    // —— Constructor ——
    constructor() {
        admin = msg.sender;
        totalSoulbound = 0;
    }

    // —— Admin Functions ——

    /// @notice Transfer admin rights to a new address.
    function transferAdmin(address newAdmin) external onlyAdmin {
        require(newAdmin != address(0), "HRP: zero admin");
        emit AdminTransferred(admin, newAdmin);
        admin = newAdmin;
    }

    /// @notice Verify a user’s personhood and mint their soulbound “ID” token.
    function verifyPersonhood(address user) external onlyAdmin {
        require(!verifiedPersonhood[user], "HRP: already verified");
        verifiedPersonhood[user] = true;
        emit IdentityVerified(user, true);

        // Mint soulbound token
        _mintSoulbound(user);
    }

    // —— Internal Soulbound Logic ——

    /// @notice Internal mint of a soulbound “certificate” upon personhood verification.
    function _mintSoulbound(address to) internal {
        require(verifiedPersonhood[to], "HRP: must be verified");
        require(soulboundId[to] == 0, "HRP: SBT already minted");

        totalSoulbound += 1;
        soulboundId[to] = totalSoulbound;
        emit SovereignMint(to, totalSoulbound, block.number);
    }

    // —— User Privacy Controls ——

    /// @notice Enable privacy shield, opting into privacy-by-default guarantees.
    function activatePrivacyShield() external onlyHuman(msg.sender) {
        require(!privacyShield[msg.sender], "HRP: shield already active");
        privacyShield[msg.sender] = true;
        emit PrivacyShieldActivated(msg.sender);
    }

    /// @notice Disable privacy shield if user chooses to reveal.
    function revokePrivacyShield() external onlyHuman(msg.sender) {
        require(privacyShield[msg.sender], "HRP: shield not active");
        privacyShield[msg.sender] = false;
        emit PrivacyShieldRevoked(msg.sender);
    }

    // —— View Helpers ——

    /// @notice Check if an address holds a soulbound token (i.e., verified).
    function hasSoulbound(address user) external view returns (bool) {
        return soulboundId[user] != 0;
    }

    /// @notice Retrieve the soulbound token ID for a user.
    function getSoulboundId(address user) external view returns (uint256) {
        return soulboundId[user];
    }

    /// @notice Is user privacy-shielded?
    function isPrivacyShielded(address user) external view returns (bool) {
        return privacyShield[user];
    }
}
