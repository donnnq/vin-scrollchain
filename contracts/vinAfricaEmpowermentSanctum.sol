pragma solidity ^0.8.19;

contract vinAfricaEmpowermentSanctum {
    address public scrollBearer;
    uint256 public fundVault;

    struct Grantee {
        address recipient;
        string country;
        string purpose;
        bool trained;
        bool hired;
    }

    Grantee[] public grantees;
    mapping(address => bool) public agents;
    mapping(address => bool) public whitelisted;

    modifier onlyBearer() {
        require(msg.sender == scrollBearer, "You are not the scroll bearer.");
        _;
    }

    modifier onlyAgent() {
        require(agents[msg.sender], "Not an authorized agent.");
        _;
    }

    modifier onlyAfrican(address _recipient) {
        require(bytes(getCountryCode(_recipient)).length > 0, "Not eligible under African sanctum.");
        _;
    }

    constructor(uint256 _fundVault) {
        scrollBearer = msg.sender;
        fundVault = _fundVault;
    }

    function whitelist(address _recipient, string memory _country) external onlyBearer {
        // You choose who qualifies
        require(isAfricanCountry(_country), "Must be African country.");
        whitelisted[_recipient] = true;
        grantees.push(Grantee(_recipient, _country, "", false, false));
    }

    function authorizeAgent(address _agent) external onlyBearer {
        agents[_agent] = true;
    }

    function grantSupport(uint256 _index, string memory _purpose) external onlyAgent {
        Grantee storage g = grantees[_index];
        require(whitelisted[g.recipient], "Recipient not whitelisted.");
        g.purpose = _purpose;
    }

    function certifyTraining(uint256 _index) external onlyAgent {
        grantees[_index].trained = true;
    }

    function certifyHiring(uint256 _index) external onlyAgent {
        grantees[_index].hired = true;
    }

    // Mock function to simulate African eligibility
    function getCountryCode(address _recipient) internal view returns (string memory) {
        if (_recipient == 0x123...) return "LS"; // Example for Lesotho
        return ""; // Default: not eligible
    }

    function isAfricanCountry(string memory _code) internal pure returns (bool) {
        return (
            keccak256(abi.encodePacked(_code)) == keccak256(abi.encodePacked("LS")) || // Lesotho
            keccak256(abi.encodePacked(_code)) == keccak256(abi.encodePacked("KE")) || // Kenya
            keccak256(abi.encodePacked(_code)) == keccak256(abi.encodePacked("NG"))    // Nigeria
            // Extend for other African countries
        );
    }
}
