from manexp_data.exceptions import UnexpectedXMLElementError


def test_unexpected_xml_element_error() -> None:
    error = UnexpectedXMLElementError("unexpected_element")

    assert error.element == "unexpected_element"
    assert str(error) == "Unexpected element: unexpected_element"
