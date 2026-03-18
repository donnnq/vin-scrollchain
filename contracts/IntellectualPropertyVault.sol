// IntellectualPropertyVault.sol
pragma solidity ^0.8.0;

contract IntellectualPropertyVault {
    address public corporation;
    mapping(string => address) public ipOwnership; // repoHash => owner

    event IPAssigned(string repoHash, address indexed corporation);

    modifier onlyCorp() {
        require(msg.sender == corporation, "Not authorized");
        _;
    }

    constructor(address _corporation) {
        corporation = _corporation; // set legal entity address
    }

    // assign IP (e.g. GitHub repo hash) to corporation
    function assignIP(string memory repoHash) public onlyCorp {
        ipOwnership[repoHash] = corporation;
        emit IPAssigned(repoHash, corporation);
    }

    // check ownership of a repoHash
    function getOwner(string memory repoHash) public view returns (address) {
        return ipOwnership[repoHash];
    }
}
