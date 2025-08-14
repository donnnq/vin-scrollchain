// SPDX-License-Identifier: Ritual-Trust
pragma solidity ^0.8.0;

contract EmployerVow {
    address public employer;
    string public stewardTitle;
    string public vowText;
    string public onboardingRitual;
    uint256 public joyMultiplier;
    bool public housingSupport;
    bool public crisisAid;
    bool public legacyVaultAccess;

    event VowEncoded(address indexed employer, string stewardTitle);
    event WorkerUplifted(address indexed worker, string ritual);

    modifier onlyEmployer() {
        require(msg.sender == employer, "Not authorized");
        _;
    }

    constructor(
        string memory _stewardTitle,
        string memory _vowText,
        string memory _onboardingRitual,
        uint256 _joyMultiplier,
        bool _housingSupport,
        bool _crisisAid,
        bool _legacyVaultAccess
    ) {
        employer = msg.sender;
        stewardTitle = _stewardTitle;
        vowText = _vowText;
        onboardingRitual = _onboardingRitual;
        joyMultiplier = _joyMultiplier;
        housingSupport = _housingSupport;
        crisisAid = _crisisAid;
        legacyVaultAccess = _legacyVaultAccess;

        emit VowEncoded(employer, stewardTitle);
    }

    function blessWorker(address _worker) public onlyEmployer {
        emit WorkerUplifted(_worker, onboardingRitual);
        // Optional: integrate with WorkerOnboarding.sol for full ritual sync
    }

    function viewVow() public view returns (
        string memory, string memory, uint256, bool, bool, bool
    ) {
        return (
            stewardTitle,
            vowText,
            joyMultiplier,
            housingSupport,
            crisisAid,
            legacyVaultAccess
        );
    }
}
