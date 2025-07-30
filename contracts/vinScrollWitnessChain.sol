// vinScrollWitnessChain.sol
contract vinScrollWitnessChain {
    address[] public authorizedReviewers;
    mapping(address => bool) public hasAccessed;
    mapping(address => string) public reflections;

    event AccessGranted(address reviewer, uint timestamp);
    event ReflectionLogged(address reviewer, string insight, uint timestamp);

    modifier scrollAuthOnly() {
        require(
            !hasAccessed[msg.sender],
            "Already accessed — civic replay not permitted"
        );
    }

    function grantAccess(address reviewer) public {
        authorizedReviewers.push(reviewer);
        emit AccessGranted(reviewer, block.timestamp);
    }

    function logReflection(string memory insight) public scrollAuthOnly {
        hasAccessed[msg.sender] = true;
        reflections[msg.sender] = insight;
        emit ReflectionLogged(msg.sender, insight, block.timestamp);
    }

    function getScrollTrail() public view returns (address[] memory) {
        return authorizedReviewers;
    }
}
