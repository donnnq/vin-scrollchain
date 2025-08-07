contract vinClarityRelay {
    struct ScrollExplanation {
        string contractName;
        string purpose;
        string implementationGuide;
        string civicImpact;
        string callToAction;
    }

    mapping(string => ScrollExplanation) public scrolls;

    function registerScroll(
        string memory _name,
        string memory _purpose,
        string memory _guide,
        string memory _impact,
        string memory _action
    ) public {
        scrolls[_name] = ScrollExplanation(_name, _purpose, _guide, _impact, _action);
    }

    function getExplanation(string memory _name) public view returns (ScrollExplanation memory) {
        return scrolls[_name];
    }
}
