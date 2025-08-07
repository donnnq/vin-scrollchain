pragma solidity ^0.8.0;

contract vinCivicUIBadgeRenderer {
    struct BadgeVisual {
        string badgeTitle;
        string svgMarkup;
        string colorTheme;
        string sigilSymbol;
        string chakraAlignment;
        uint256 createdAt;
    }

    mapping(string => BadgeVisual) public visuals;

    event VisualCreated(string badgeTitle, string chakraAlignment, string colorTheme);

    function addVisual(
        string memory _badgeTitle,
        string memory _svgMarkup,
        string memory _colorTheme,
        string memory _sigilSymbol,
        string memory _chakraAlignment
    ) public {
        visuals[_badgeTitle] = BadgeVisual({
            badgeTitle: _badgeTitle,
            svgMarkup: _svgMarkup,
            colorTheme: _colorTheme,
            sigilSymbol: _sigilSymbol,
            chakraAlignment: _chakraAlignment,
            createdAt: block.timestamp
        });

        emit VisualCreated(_badgeTitle, _chakraAlignment, _colorTheme);
    }

    function getVisual(string memory _badgeTitle) public view returns (BadgeVisual memory) {
        return visuals[_badgeTitle];
    }
}
