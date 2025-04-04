@extends('backend.layout')

{{-- this style will be applied when the direction of language is right-to-left --}}
@includeIf('backend.partials.rtl_style')

@section('content')
  <div class="page-header">
    <h4 class="page-title">Menu Builder</h4>
    <ul class="breadcrumbs">
      <li class="nav-home">
        <a href="{{ route('admin.dashboard') }}">
          <i class="flaticon-home"></i>
        </a>
      </li>
      <li class="separator">
        <i class="flaticon-right-arrow"></i>
      </li>
      <li class="nav-item">
        <a href="#">Menu Builder</a>
      </li>
    </ul>
  </div>
  <div class="row">
    <div class="col-md-12">
      <div class="card">
        <div class="card-header">
          <div class="row">
            <div class="col-lg-10">
              <div class="card-title">Menu Builder</div>
            </div>
            <div class="col-lg-2">
              @if (!empty($langs))
                <select name="language" class="form-control"
                  onchange="window.location='{{ url()->current() . '?language=' }}'+this.value">
                  <option value="" selected disabled>Select a Language</option>
                  @foreach ($langs as $lang)
                    <option value="{{ $lang->code }}"
                      {{ $lang->code == request()->input('language') ? 'selected' : '' }}>{{ $lang->name }}</option>
                  @endforeach
                </select>
              @endif
            </div>
          </div>
        </div>
        <div class="card-body pt-5 pb-5">
          <div class="row no-gutters">
            <div class="col-lg-4">
              <div class="card border-primary mb-3">
                <div class="card-header bg-primary text-white">Pre-built Menus</div>
                <div class="card-body">
                  <ul class="list-group">
                    <li class="list-group-item">{{ __('Home') }} <a data-text="{{ __('Home') }}" data-type="home"
                        class="addToMenus btn btn-primary btn-sm float-right" href="">Add to Menus</a></li>
                    <li class="list-group-item">{{ __('Rooms') }}
                      <a data-text="{{ __('Rooms') }}" data-type="rooms"
                        class="addToMenus btn btn-primary btn-sm float-right" href="">Add to Menus</a>
                    </li>
                    <li class="list-group-item">{{ __('Services') }}
                      <a data-text="{{ __('Services') }}" data-type="services"
                        class="addToMenus btn btn-primary btn-sm float-right" href="">Add to Menus</a>
                    </li>

                    <li class="list-group-item">{{ __('Landlords') }}
                      <a data-text="{{ __('Vendors') }}" data-type="vendors"
                        class="addToMenus btn btn-primary btn-sm float-right" href="">Add to Menus</a>
                    </li>

                    <li class="list-group-item">{{ __('Blogs') }}
                      <a data-text="{{ __('Blogs') }}" data-type="blogs"
                        class="addToMenus btn btn-primary btn-sm float-right" href="">Add to Menus</a>
                    </li>

                    <li class="list-group-item">{{ __('Gallery') }} <a data-text="{{ __('Gallery') }}"
                        data-type="gallery" class="addToMenus btn btn-primary btn-sm float-right" href="">Add to
                        Menus</a></li>

                    <li class="list-group-item">{{ __('Property') }} <a data-text="{{ __('Property') }}"
                        data-type="packages" class="addToMenus btn btn-primary btn-sm float-right" href="">Add to
                        Menus</a></li>

                    <li class="list-group-item">{{ __('FAQs') }} <a data-text="{{ __('FAQs') }}" data-type="faq"
                        class="addToMenus btn btn-primary btn-sm float-right" href="">Add to Menus</a></li>

                    <li class="list-group-item">{{ __('Contact') }} <a data-text="{{ __('Contact') }}"
                        data-type="contact" class="addToMenus btn btn-primary btn-sm float-right" href="">Add to
                        Menus</a></li>

                    <li class="list-group-item">{{ __('About') }} <a data-text="{{ __('About') }}"
                        data-type="about" class="addToMenus btn btn-primary btn-sm float-right" href="">Add to
                        Menus</a></li>

                    @foreach ($pages as $page)
                      <li class="list-group-item">
                        {{ $page->name }} <span class="badge badge-primary">Custom Page</span>
                        <a data-text="{{ $page->name }}" data-type="{{ $page->page_id }}" data-custom="yes"
                          class="addToMenus btn btn-primary btn-sm float-right" href="">Add to Menus</a>
                      </li>
                    @endforeach
                  </ul>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="card border-primary mb-3">
                <div class="card-header bg-primary text-white">Add / Edit Menu</div>
                <div class="card-body">
                  <form id="frmEdit" class="form-horizontal">
                    <input class="item-menu" type="hidden" name="type" value="">

                    <div id="withUrl">
                      <div class="form-group">
                        <label for="text">Text</label>
                        <input type="text" class="form-control item-menu" name="text" placeholder="Text">
                      </div>
                      <div class="form-group">
                        <label for="href">URL</label>
                        <input type="text" class="form-control item-menu" name="href" placeholder="URL">
                      </div>
                      <div class="form-group">
                        <label for="target">Target</label>
                        <select name="target" id="target" class="form-control item-menu">
                          <option value="_self">Self</option>
                          <option value="_blank">Blank</option>
                          <option value="_top">Top</option>
                        </select>
                      </div>
                    </div>

                    <div id="withoutUrl" style="display: none;">
                      <div class="form-group">
                        <label for="text">Text</label>
                        <input type="text" class="form-control item-menu" name="text" placeholder="Text">
                      </div>
                      <div class="form-group">
                        <label for="href">URL</label>
                        <input type="text" class="form-control item-menu" name="href" placeholder="URL">
                      </div>
                      <div class="form-group">
                        <label for="target">Target</label>
                        <select name="target" class="form-control item-menu">
                          <option value="_self">Self</option>
                          <option value="_blank">Blank</option>
                          <option value="_top">Top</option>
                        </select>
                      </div>
                    </div>
                  </form>
                </div>
                <div class="card-footer">
                  <button type="button" id="btnUpdate" class="btn btn-primary" disabled><i
                      class="fas fa-sync-alt"></i> Update</button>
                  <button type="button" id="btnAdd" class="btn btn-success"><i class="fas fa-plus"></i>
                    Add</button>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="card mb-3">
                <div class="card-header bg-primary text-white">Website Menus</div>
                <div class="card-body">
                  <ul id="myEditor" class="sortableLists list-group">
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="card-footer pt-3">
          <div class="form">
            <div class="form-group from-show-notify row">
              <div class="col-12 text-center">
                <button id="btnOutput" class="btn btn-success">Update Menu</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

@endsection



@section('script')
  <script type="text/javascript" src="{{ asset('assets/js/jquery-menu-editor.js') }}"></script>
  <script>
    "use strict";
    var prevMenus = {!! json_encode($prevMenu) !!};
    var langid = {{ $lang_id }};
    var menuUpdate = "{{ route('admin.menu_builder.update') }}";
  </script>
  <script type="text/javascript" src="{{ asset('assets/js/menu-builder.js') }}"></script>
@endsection
