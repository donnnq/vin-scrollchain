// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract vinBlessingVerifier {
    address public scrollsmith;
    uint public verificationCount;

    struct BlessingVerification {
        string traineeName;
        string skillCompleted;
        string matchedJob;
        string employerName;
        bool skillMatch;
        bool ethicsConfirmed;
        bool onboardingVerified;
        string verificationNotes;
    }

    mapping(uint => BlessingVerification) public verifiedBlessings;

    event VerificationLogged(
        string traineeName,
        string matchedJob,
        bool skillMatch,
        bool ethicsConfirmed,
        bool onboardingVerified
    );

    event ScrollsmithTransferred(address oldScrollsmith, address newScrollsmith);

    constructor() {
        scrollsmith = msg.sender;
    }

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Only scrollsmith may log blessing verifications.");
        _;
    }

    // ✅ Log a blessing verification with detailed checks
    function logVerification(
        string memory traineeName,
        string memory skillCompleted,
        string memory matchedJob,
        string memory employerName,
        bool skillMatch,
        bool ethicsConfirmed,
        bool onboardingVerified,
        string memory verificationNotes
    ) public onlyScrollsmith {
        verifiedBlessings[verificationCount++] = BlessingVerification(
            traineeName,
            skillCompleted,
            matchedJob,
            employerName,
            skillMatch,
            ethicsConfirmed,
            onboardingVerified,
            verificationNotes
        );

        emit VerificationLogged(
            traineeName,
            matchedJob,
            skillMatch,
            ethicsConfirmed,
            onboardingVerified
        );
    }

    // 🔍 View verification metadata
    function getVerification(uint id) public view returns (
        string memory traineeName,
        string memory skillCompleted,
        string memory matchedJob,
        string memory employerName,
        bool skillMatch,
        bool ethicsConfirmed,
        bool onboardingVerified,
        string memory verificationNotes
    ) {
        BlessingVerification memory v = verifiedBlessings[id];
        return (
            v.traineeName,
            v.skillCompleted,
            v.matchedJob,
            v.employerName,
            v.skillMatch,
            v.ethicsConfirmed,
            v.onboardingVerified,
            v.verificationNotes
        );
    }

    // 🔄 Transfer scrollsmith role
    function transferScrollsmith(address newScrollsmith) public onlyScrollsmith {
        require(newScrollsmith != address(0), "Invalid address.");
        emit ScrollsmithTransferred(scrollsmith, newScrollsmith);
        scrollsmith = newScrollsmith;
    }

    // 📊 View total verifications logged
    function totalVerifications() public view returns (uint) {
        return verificationCount;
    }
}
