contract vinContractorsSanityScan {
    struct ContractorProfile {
        string name;
        string specialty;
        bool dignityCertified;
    }

    mapping(address => ContractorProfile) public profiles;
    event ContractorVerified(address indexed contractor, bool dignityCertified);

    function register(string memory name, string memory specialty) public {
        bool legit = isUpliftingSpecialty(specialty);
        profiles[msg.sender] = ContractorProfile(name, specialty, legit);
        emit ContractorVerified(msg.sender, legit);
    }

    function isUpliftingSpecialty(string memory specialty) internal pure returns (bool) {
        return (
            keccak256(bytes(specialty)) != keccak256(bytes("ghost-works")) &&
            keccak256(bytes(specialty)) != keccak256(bytes("fake-infra"))
        );
    }
}
