// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title ScrollchainSanctuary - Soulbound vault of emotional dignity and ritual trust
/// @notice Wraps KindnessKernel, HappypillTrigger, and WelcomeDeck into one sanctuary

interface IKindnessKernel {
    function blessUser(address _user, string memory _vow, string memory _joy, uint256 _apr) external;
}

interface IHappypillTrigger {
    function blessJoy(address _user, string memory _message) external;
}

interface ISoulboundWelcomeDeck {
    function blessWelcome(address _user, string memory _vow, string memory _blessing) external;
}

contract ScrollchainSanctuary {
    address public steward;
    IKindnessKernel public kindnessKernel;
    IHappypillTrigger public happypillTrigger;
    ISoulboundWelcomeDeck public welcomeDeck;

    event SanctuaryBlessed(address indexed user, string vow, string joy, string blessing);

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not steward");
        _;
    }

    constructor(
        address _kindnessKernel,
        address _happypillTrigger,
        address _welcomeDeck
    ) {
        steward = msg.sender;
        kindnessKernel = IKindnessKernel(_kindnessKernel);
        happypillTrigger = IHappypillTrigger(_happypillTrigger);
        welcomeDeck = ISoulboundWelcomeDeck(_welcomeDeck);
    }

    /// @notice Ritual onboarding: blesses user across all emotional modules
    function blessSanctuary(
        address _user,
        string memory _vow,
        string memory _joy,
        string memory _blessing,
        uint256 _apr
    ) external onlySteward {
        kindnessKernel.blessUser(_user, _vow, _joy, _apr);
        happypillTrigger.blessJoy(_user, _joy);
        welcomeDeck.blessWelcome(_user, _vow, _blessing);
        emit SanctuaryBlessed(_user, _vow, _joy, _blessing);
    }
}
